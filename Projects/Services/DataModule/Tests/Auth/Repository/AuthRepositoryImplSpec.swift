import Quick
import Nimble
import Combine
import DomainModule
import DataModule
import KeychainModule
import DatabaseModule
import NetworkModule

// swiftlint: disable function_body_length
final class AuthRepositoryImplSpec: QuickSpec {
    override func spec() {
        var sut: AuthRepositoryImpl!
        var remoteAuthDS: RemoteAuthDataSource!
        var localAuthDS: LocalAuthDataSource!
        var bag = Set<AnyCancellable>()

        beforeEach {
            remoteAuthDS = RemoteAuthDataSourceStub()
            localAuthDS = LocalAuthDataSourceStub()
            sut = AuthRepositoryImpl(remoteAuthDataSource: remoteAuthDS, localAuthDataSource: localAuthDS)
        }
        describe("AuthRepositoryImpl에서") {
            context("signin()를 실행하면") {
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
                    expect { res?.remainService }.to(beFalse())
                    expect { res?.studyRoomService }.to(beFalse())
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
