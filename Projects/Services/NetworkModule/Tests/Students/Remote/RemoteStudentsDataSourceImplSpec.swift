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
final class RemoteStudentsDataSourceImplSpec: QuickSpec {
    override func spec() {
        var provider: MoyaProvider<StudentsAPI>!
        var sut: RemoteStudentsDataSourceImpl!
        var bag = Set<AnyCancellable>()
        var keychain: Keychain!

        beforeEach {
            keychain = KeychainFake()
            let customEndpointClosure = { (target: StudentsAPI) -> Endpoint in
                Endpoint(
                    url: URL(target: target).absoluteString,
                    sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: target.headers
                )
            }
            provider = MoyaProvider(
                endpointClosure: customEndpointClosure,
                stubClosure: MoyaProvider.immediatelyStub
            )
            sut = RemoteStudentsDataSourceImpl(
                keychain: keychain,
                provider: provider
            )
        }
        describe("RemoteStudentsDataSourceImpl에서") {
            context("Signup()을 실행하면 ") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.signup(
                        req: SignupRequestDTO(
                            schoolCode: "",
                            schoolAnswer: "",
                            email: "",
                            authCode: "",
                            grade: 0,
                            classRoom: 0,
                            number: 0,
                            accountID: "",
                            password: "",
                            profileImageUrl: nil
                        )
                    )
                    .sink { _ in } receiveValue: { item in
                        success = item
                    }
                    .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                }
            }
            context("checkDuplicateAccountID()을 실행하면 ") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.checkDuplicateAccountID(id: "")
                        .sink { _ in } receiveValue: { item in
                            success = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                }
            }
            context("checkDuplicateEmail()을 실행하면 ") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.checkDuplicateEmail(email: "")
                        .sink { _ in } receiveValue: { item in
                            success = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                }
            }
            context("renewalPassword()을 실행하면 ") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.renewalPassword(req: .init(accountID: "", name: "", email: "", authCode: "", newPassword: ""))
                        .sink { _ in } receiveValue: { item in
                            success = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                }
            }
            context("findID()을 실행하면 ") {
                it("request를 성공적으로 실행하고, abc******@gmail.com가 response로 온다.") {
                    var success: Void?
                    var res: String?
                    sut.findID(req: .init(schoolID: "", name: "", grade: 0, classRoom: 0, number: 0))
                        .sink { _ in } receiveValue: { email in
                            success = ()
                            res = email
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                    expect { res }.toNotEventually(beNil())
                    expect { res }.toEventually(equal("abc*****@gmail.com"))
                }
            }
            context("keychain의 accessToken이 유효한상태로 fetchMyProfile()을 실행하면 ") {
                beforeEach {
                    keychain.save(type: .accessToken, value: "Value")
                }
                afterEach {
                    keychain.delete(type: .accessToken)
                }
                it("request가 실패한다.") {
                    var success: Void?
                    var res: MyProfileEntity?
                    sut.fetchMyProfile()
                        .sink { _ in } receiveValue: { user in
                            success = ()
                            res = user
                        }
                        .store(in: &bag)
                    expect { success }.toEventually(beNil())
                    expect { success }.toNotEventually(beVoid())
                    expect { res }.toEventually(beNil())
                }
            }
            context("keychain의 expiredAt이 유효한상태로 fetchMyProfile()을 실행하면 ") {
                beforeEach {
                    keychain.save(type: .accessExpiredAt, value: Date().addingTimeInterval(500).toDMSDateString())
                }
                afterEach {
                    keychain.delete(type: .accessExpiredAt)
                }
                it("request를 성공적으로 실행하고, sampleData가 Response로 온다.") {
                    var success: Void?
                    var res: MyProfileEntity?
                    sut.fetchMyProfile()
                        .sink { _ in } receiveValue: { user in
                            success = ()
                            res = user
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                    expect { res }.toNotEventually(beNil())
                    expect { res!.schoolName }.toEventually(equal("광주소프트웨어마이스터고등학교"))
                    expect { res!.name }.toEventually(equal("변찬우"))
                    expect { res!.gcn }.toEventually(equal("2118"))
                    expect { res!.bonusPoint }.toEventually(equal(0))
                    expect { res!.minusPoint }.toEventually(equal(24))
                    expect { res!.phrase }.toEventually(equal("안녕하세요 프론트하는 변찬우입니다"))
                }
            }
            context("keychain의 accessToken과 유효한 expiredAt시간을 가진상태로 fetchMyProfile()을 실행하면 ") {
                beforeEach {
                    keychain.save(type: .accessToken, value: "Value")
                    keychain.save(type: .accessExpiredAt, value: Date().addingTimeInterval(500).toDMSDateString())
                }
                afterEach {
                    keychain.delete(type: .accessToken)
                    keychain.delete(type: .accessExpiredAt)
                }
                it("request를 성공적으로 실행하고, sampleData가 Response로 온다.") {
                    var success: Void?
                    var res: MyProfileEntity?
                    sut.fetchMyProfile()
                        .sink { _ in } receiveValue: { user in
                            success = ()
                            res = user
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                    expect { res }.toNotEventually(beNil())
                    expect { res!.schoolName }.toEventually(equal("광주소프트웨어마이스터고등학교"))
                    expect { res!.name }.toEventually(equal("변찬우"))
                    expect { res!.gcn }.toEventually(equal("2118"))
                    expect { res!.bonusPoint }.toEventually(equal(0))
                    expect { res!.minusPoint }.toEventually(equal(24))
                    expect { res!.phrase }.toEventually(equal("안녕하세요 프론트하는 변찬우입니다"))
                }
            }
        }
    }
}
