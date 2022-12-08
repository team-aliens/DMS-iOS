import APIKit
import Combine
import CombineMoya
import ErrorModule
import Foundation
import KeychainModule
import Moya
import Utility

public class BaseRemoteDataSource<API: DmsAPI> {
    private let keychain: any Keychain
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()
    private let maxRetryCount = 2

    public init(
        keychain: any Keychain,
        provider: MoyaProvider<API>? = nil
    ) {
        self.keychain = keychain

        #if DEBUG
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain), NetworkLoggerPlugin()])
        #else
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain)])
        #endif
    }

    public func request<T: Decodable>(_ api: API, dto: T.Type) -> AnyPublisher<T, DmsError> {
        requestPublisher(api)
            .map(\.data)
            .decode(type: dto, decoder: decoder)
            .mapError { $0.asDMSError }
            .eraseToAnyPublisher()
    }

    public func request(_ api: API) -> AnyPublisher<Void, DmsError> {
        requestPublisher(api)
            .map { _ in return }
            .eraseToAnyPublisher()
    }

    private func requestPublisher(_ api: API) -> AnyPublisher<Response, DmsError> {
        return checkIsApiNeedsAuthorization(api) ?
            authorizedRequest(api) :
            defaultRequest(api)
    }
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: API) -> AnyPublisher<Response, DmsError> {
        provider.requestPublisher(api, callbackQueue: .main)
            .retry(maxRetryCount)
            .timeout(45, scheduler: DispatchQueue.main)
            .mapError { api.errorMap[$0.response?.statusCode ?? 0] ?? .unknown }
            .eraseToAnyPublisher()
    }

    func authorizedRequest(_ api: API) -> AnyPublisher<Response, DmsError> {
        if checkTokenIsExpired() {
            return tokenReissue()
                .retry(maxRetryCount)
                .flatMap { self.defaultRequest(api) }
                .eraseToAnyPublisher()
        } else {
            return defaultRequest(api)
        }
    }

    func checkIsApiNeedsAuthorization(_ api: API) -> Bool {
        api.jwtTokenType == .accessToken
    }

    func checkTokenIsExpired() -> Bool {
        let expired = keychain.load(type: .expiredAt).toDMSDate()
        return Date() > expired
    }

    func tokenReissue() -> AnyPublisher<Void, DmsError> {
        let provider = MoyaProvider<AuthAPI>(plugins: [JwtPlugin(keychain: keychain)])
        return provider.requestPublisher(.reissueToken)
            .map { _ in return }
            .mapError { _ in DmsError.unknown }
            .eraseToAnyPublisher()
    }
}
