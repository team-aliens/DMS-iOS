import Combine
import CombineMoya
import Foundation
import KeychainModule
import Moya
import UtilityModule

open class BaseRemoteDataSource<API: DmsAPI> {
    private let keychain: any Keychain
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()
    private let maxRetryCount = 2

    public init(
        keychain: any Keychain,
        provider: MoyaProvider<API>? = nil
    ) {
        self.keychain = keychain

        #if DEV || STAGE
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain), MoyaLogginPlugin()])
        #else
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain)])
        #endif
    }

    public func request<T: Decodable>(_ api: API, dto: T.Type) -> AnyPublisher<T, Error> {
        requestPublisher(api)
            .map(\.data)
            .decode(type: dto, decoder: decoder)
            .eraseToAnyPublisher()
    }

    public func request(_ api: API) -> AnyPublisher<Void, Error> {
        requestPublisher(api)
            .map { _ in return }
            .eraseToAnyPublisher()
    }

    private func requestPublisher(_ api: API) -> AnyPublisher<Response, Error> {
        return checkIsApiNeedsAuthorization(api) ?
            authorizedRequest(api) :
            defaultRequest(api)
    }
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: API) -> AnyPublisher<Response, Error> {
        provider.requestPublisher(api, callbackQueue: .main)
            .retry(maxRetryCount)
            .timeout(45, scheduler: DispatchQueue.main)
            .mapError { api.errorMap[$0.response?.statusCode ?? 0] ?? $0 as Error }
            .eraseToAnyPublisher()
    }

    func authorizedRequest(_ api: API) -> AnyPublisher<Response, Error> {
        if checkTokenIsExpired() {
            return tokenReissue()
                .retry(maxRetryCount)
                .flatMap { self.defaultRequest(api) }
                .eraseToAnyPublisher()
        } else {
            return defaultRequest(api)
                .retry(maxRetryCount)
                .eraseToAnyPublisher()
        }
    }

    func checkIsApiNeedsAuthorization(_ api: API) -> Bool {
        api.jwtTokenType == .accessToken
    }

    func checkTokenIsExpired() -> Bool {
        let expired = keychain.load(type: .accessExpiresAt).toDMSDate()
        print(Date(), expired)
        return Date() > expired
    }

    func tokenReissue() -> AnyPublisher<Void, Error> {
        let provider = MoyaProvider<RefreshAPI>(plugins: [JwtPlugin(keychain: keychain)])
        return provider.requestPublisher(.reissueToken)
            .map { _ in }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
