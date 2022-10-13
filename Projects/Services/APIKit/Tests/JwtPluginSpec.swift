import Quick
import Nimble
import Moya
import Foundation
@testable import APIKit
@testable import KeychainModule

// swiftlint: disable function_body_length
final class JwtPluginSpec: QuickSpec {
    override func spec() {
        var keychain: Keychain!
        var plugin: JwtPlugin!
        var api: MoyaProvider<TestAPI>!

        beforeEach {
            keychain = KeychainFake()
            plugin = JwtPlugin(keychain: keychain)
            let customEnpointClosure = { (target: TestAPI) -> Endpoint in
                Endpoint(
                    url: URL(target: target).absoluteString,
                    sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: target.headers
                )
            }
            api = MoyaProvider(
                endpointClosure: customEnpointClosure,
                stubClosure: MoyaProvider.immediatelyStub,
                plugins: [plugin]
            )
        }

        describe("JwtPlugin을 사용하는 API는") {
            afterEach {
                keychain.delete(type: .accessToken)
                keychain.delete(type: .refreshToken)
                keychain.delete(type: .expiredAt)
            }
            context("Response가 TokenDTO의 데이터 타입으로 온다면") {
                it("Keychain에 Token을 저장한다") {
                    api.request(.success) { _ in }
                    expect(keychain.load(type: .accessToken)).to(equal("access"))
                    expect(keychain.load(type: .refreshToken)).to(equal("refresh"))
                    expect(keychain.load(type: .expiredAt)).to(equal("expired"))
                }
            }
            context("Response가 TokenDTO의 데이터 타입으로 오지 않는다면") {
                it("Keychain에 아무 데이터도 저장하지 않는다") {
                    api.request(.failure) { _ in }
                    expect(keychain.load(type: .accessToken)).to(beEmpty())
                    expect(keychain.load(type: .refreshToken)).to(beEmpty())
                    expect(keychain.load(type: .expiredAt)).to(beEmpty())
                }
            }
            context("Enpoint의 JwtAuthorizable인 .accessToken인 API요청을 한다면") {
                beforeEach {
                    keychain.save(type: .accessToken, value: "Access")
                }
                it("HTTPHeader의 Authorization에, 앞에 Bearer와 함께 AccessToken키체인에 저장된 값이 자동으로 담긴다") {
                    api.request(.withAccess) { result in
                        switch result {
                        case .failure:
                            fail("요청이 실패함")

                        case let .success(res):
                            expect(res.request?.allHTTPHeaderFields?["Authorization"]).toNot(beNil())
                            expect(res.request?.allHTTPHeaderFields?["Authorization"]).to(equal("Bearer Access"))
                            expect(res.statusCode).to(equal(200))
                        }
                    }
                }
            }
            context("Enpoint의 JwtAuthorizable인 .refreshToken인 API요청을 한다면") {
                beforeEach {
                    keychain.save(type: .refreshToken, value: "Refresh")
                }
                it("HTTPHeader의 refresh-token에, 앞에 Bearer와 함께 RefreshToken키체인에 저장된 값이 자동으로 담긴다") {
                    api.request(.withRefresh) { result in
                        switch result {
                        case .failure:
                            fail("요청이 실패함")

                        case let .success(res):
                            expect(res.request?.allHTTPHeaderFields?["refresh-token"]).toNot(beNil())
                            expect(res.request?.allHTTPHeaderFields?["refresh-token"]).to(equal("Bearer Refresh"))
                            expect(res.statusCode).to(equal(200))
                        }
                    }
                }
            }
        }
    }
}
