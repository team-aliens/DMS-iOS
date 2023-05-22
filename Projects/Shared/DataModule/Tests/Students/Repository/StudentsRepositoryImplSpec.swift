import Quick
import Nimble
import Combine
import DomainModule
import DataModule
import NetworkModule

// swiftlint: disable function_body_length
final class StudentsRepositoryImplSpec: QuickSpec {
    override func spec() {
        var sut: StudentsRepositoryImpl!
        var remoteStudentsDS: RemoteStudentsDataSource!
        var bag = Set<AnyCancellable>()

        beforeEach {
            remoteStudentsDS =  RemoteStudentsDataSourceStub()
            sut = StudentsRepositoryImpl(remoteStudentsDataSource: remoteStudentsDS)
        }
        describe("StudentsRepositoryImpl에서") {
            context("signup()을 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: DmsFeatures?
                    sut.signup(
                        req: .init(
                            schoolCode: "",
                            schoolAnswer: "",
                            email: "",
                            authCode: "",
                            grade: 0,
                            classRoom: 0,
                            number: 0,
                            accountID: "",
                            password: "",
                            profileImageUrl: ""
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
            context("checkDuplicateAccountID()을 실행하면") {
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
            context("checkDuplicateEmail()을 실행하면") {
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
            context("renewalPassword()을 실행하면") {
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
            context("findID()을 실행하면") {
                it("request를 성공적으로 실행하고, response가 온다") {
                    var success: Void?
                    var res: String?
                    sut.findID(req: .init(schoolID: "", name: "", grade: 0, classRoom: 0, number: 0))
                    .sink { _ in } receiveValue: { item in
                        success = ()
                        res = item
                    }
                    .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                    expect { res }.toNotEventually(beNil())
                    expect { res }.toEventually(equal("abcdef@gmail.com"))
                }
            }
            context("fetchMyProfile()을 실행하면") {
                it("request를 성공적으로 실행하고, response가 온다") {
                    var success: Void?
                    var res: MyProfileEntity?
                    sut.fetchMyProfile()
                    .sink { _ in } receiveValue: { item in
                        success = ()
                        res = item
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
                    expect { res!.phrase }.toEventually(equal("벌점이 12점이예요. 더 바른 생활을 위해 노력해주세요!"))
                }
            }
        }
    }
}
