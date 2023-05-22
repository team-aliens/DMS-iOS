import Foundation
import Moya

public class BaseRemoteDataSource<API: DMSAPI> {
    private let jwtStore: any JwtStore
    private let provider: MoyaProvider<API>
    private let maxRetryCount = 2

    public typealias API = API

    public init(
        jwtStore: any JwtStore,
        provider: MoyaProvider<API>? = nil
    ) {
        self.jwtStore = jwtStore
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(jwtStore: jwtStore)])
    }

    @discardableResult
    public func request<T: Decodable>(
        _ api: API,
        dto: T.Type
    ) async throws -> T {
        let res = try await checkIsApiNeedsAuth(api) ? authorizedRequest(api) : defaultRequest(api)
        return try JSONDecoder().decode(dto, from: res.data)
    }

    public func request(api: API) async throws {
        _ = try await checkIsApiNeedsAuth(api) ? authorizedRequest(api) : defaultRequest(api)
    }
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: API) async throws -> Response {
        for _ in 0..<maxRetryCount {
            do {
                try _Concurrency.Task<Never, Never>.checkCancellation()
                return try await performRequest(api)
            } catch {
                continue
            }
        }
        try _Concurrency.Task<Never, Never>.checkCancellation()
        return try await performRequest(api)
    }

    func authorizedRequest(_ api: API) async throws -> Response {
        for _ in 0..<maxRetryCount {
            do {
                try _Concurrency.Task<Never, Never>.checkCancellation()
                return try await performRequest(api)
            } catch {
                if checkTokenIsExpired() { throw DMSWatchError.accessTokenExpired }
                continue
            }
        }
        try _Concurrency.Task<Never, Never>.checkCancellation()
        return try await performRequest(api)
    }

    func performRequest(_ api: API) async throws -> Response {
        try await withCheckedThrowingContinuation { config in
            provider.request(api) { result in
                switch result {
                case let .success(res):
                    config.resume(returning: res)

                case let .failure(err):
                    guard let code = err.response?.statusCode else {
                        config.resume(throwing: GlobalDMSError.unknown)
                        return
                    }
                    config.resume(
                        throwing: api.errorMap[code] ?? GlobalDMSError.unknown
                    )
                }
            }
        }
    }

    func checkIsApiNeedsAuth(_ api: API) -> Bool {
        api.jwtTokenType == .accessToken
    }

    func checkTokenIsExpired() -> Bool {
        let expired = jwtStore.load(type: .accessExpiredAt).toDMSDate()
        return Date() > expired
    }
}
