import APIKit
import Nimble
import DataMappingModule
import DomainModule
import Combine
import Foundation
import Quick
import NetworkModule
import Moya
import XCTest
@testable import KeychainModule

// swiftlint: disable function_body_length
final class RemoteAuthDataSourceImplSpec: QuickSpec {
    override func spec() {
        var provider: MoyaProvider<AuthAPI>!
        var sut: RemoteAuthDataSourceImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            let keychain = KeychainFake()
            let customEndpointClosure = { (target: AuthAPI) -> Endpoint in
                Endpoint(url: URL(target: target).absoluteString,
                         sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                         method: target.method,
                         task: target.task,
                         httpHeaderFields: target.headers)
            }
            provider = MoyaProvider(endpointClosure: customEndpointClosure,
                                    stubClosure: MoyaProvider.immediatelyStub)
            sut = RemoteAuthDataSourceImpl(keychain: keychain,
                                           provider: provider)
        }
        describe("RemoteAuthDataSourceImpl에서") {
            context("signin()을 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    var res: DmsFeatures?
                    sut.signin(req: .init(accountID: "", password: ""))
                        .sink { _ in } receiveValue: { item in
                            success = ()
                            res = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                    expect { res }.toNot(beNil())
                }
            }
            context("verifyAuthCode()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.verifyAuthCode(req: .init(email: "", authCode: "", type: .signup))
                        .sink { _ in } receiveValue: { item in
                            success = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                }
            }
            context("sendAuthCode()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.sendAuthCode(req: .init(email: "", type: .signup))
                        .sink { _ in } receiveValue: { item in
                            success = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                }
            }
            context("checkEmailExistByAccountID()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.checkEmailExistByAccountID(req: .init(accountID: "", email: ""))
                        .sink { _ in } receiveValue: { item in
                            success = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                }
            }
            context("checkAccountIDIsExist()를 실행하면") {
                it("request를 성공적으로 실행하고, abc******@gmail.com가 response로 온다") {
                    var success: Void?
                    var res: String?
                    sut.checkAccountIDIsExist(id: "")
                        .sink { _ in } receiveValue: { email in
                            success = ()
                            res = email
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                    expect { res }.toNotEventually(beNil())
                    expect { res }.toEventually(equal("abc******@gmail.com"))
                }
            }
        }
    }
}
