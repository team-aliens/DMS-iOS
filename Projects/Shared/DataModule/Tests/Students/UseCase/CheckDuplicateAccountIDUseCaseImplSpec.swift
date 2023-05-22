import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class CheckDuplicateAccountIDUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: StudentsRepository!
        var sut: CheckDuplicateAccountIDUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = StudentsRepositoryStub()
            sut = CheckDuplicateAccountIDUseCaseImpl(studentsRepository: repo)
        }
        describe("CheckDuplicateAccountIDUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.execute(id: "")
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
