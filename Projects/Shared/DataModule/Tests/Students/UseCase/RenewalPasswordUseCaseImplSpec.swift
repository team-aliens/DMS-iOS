import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class RenewalPasswordUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: StudentsRepository!
        var sut: RenewalPasswordUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = StudentsRepositoryStub()
            sut = RenewalPasswordUseCaseImpl(studentsRepository: repo)
        }
        describe("RenewalPasswordUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.execute(req: .init(accountID: "", name: "", email: "", authCode: "", newPassword: ""))
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
