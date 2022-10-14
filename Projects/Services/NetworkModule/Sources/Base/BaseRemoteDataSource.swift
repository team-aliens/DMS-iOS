import APIKit
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
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: API) async throws -> Response {
        for _ in 0..<maxRetryCount {
            do {
                return try await performRequest(api)
            } catch {
                continue
            }
        }
        return try await performRequest(api)
    }

    func authorizedRequest(_ api: API) async throws -> Response {
        for _ in 0..<maxRetryCount {
            do {
                return try await performRequest(api)
            } catch {
                if checkTokenIsExpired() { try await tokenReissue() }
                continue
            }
        }
        return try await performRequest(api)
    }

    func performRequest(_ api: API) async throws -> Response {
        try await withCheckedThrowingContinuation { config in
            provider.request(api) { result in
                switch result {
                case let .success(res):
                    config.resume(returning: res)

                case let .failure(err):
                    let code = err.response?.statusCode ?? 500
                    config.resume(
                        throwing: api.errorMap[code] ?? .custom()
                    )
                }
            }
        }
    }

    func checkIsApiNeedsAuth(_ api: API) -> Bool {
        api.jwtTokenType == .accessToken
    }

    func checkTokenIsExpired() -> Bool {
        let expired = keychain.load(type: .expiredAt).toDMSDate()
        return Date() > expired
    }

    func tokenReissue() async throws {
        // TODO: Token Refresh
    }
}
