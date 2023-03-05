import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class CheckDuplicateEmailUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: StudentsRepository!
        var sut: CheckDuplicateEmailUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = StudentsRepositoryStub()
            sut = CheckDuplicateEmailUseCaseImpl(studentsRepository: repo)
        }
        describe("CheckDuplicateEmailUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.execute(email: "")
                        .sink { _ in } receiveValue: { item in
                            success = item
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                }
            }
        }
    }
}
