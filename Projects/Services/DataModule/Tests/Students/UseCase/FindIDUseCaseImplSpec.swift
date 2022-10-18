import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class FindIDUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: StudentsRepository!
        var sut: FindIDUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = StudentsRepositoryStub()
            sut = FindIDUseCaseImpl(studentsRepository: repo)
        }
        describe("FindIDUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행하고, response가 온다.") {
                    var success: Void?
                    var res: String?
                    sut.execute(req: .init(schoolID: "", name: "", grade: 0, classRoom: 0, number: 0))
                        .sink { _ in } receiveValue: { item in
                            success = ()
                            res = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                    expect { res }.toNotEventually(beNil())
                    expect { res }.toEventually(equal("abc*****@gmail.com"))
                }
            }
        }
    }
}
