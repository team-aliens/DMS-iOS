import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class FetchMyProfileUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: StudentsRepository!
        var sut: FetchMyProfileUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = StudentsRepositoryStub()
            sut = FetchMyProfileUseCaseImpl(studentsRepository: repo)
        }
        describe("FetchMyProfileUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행하고, response가 온다.") {
                    var success: Void?
                    var res: MyProfileEntity?
                    sut.execute()
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
                    expect { res!.phrase }.toEventually(equal("안녕하세요"))
                }
            }
        }
    }
}
