import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class CheckEmailExistByAccountIDUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: AuthRepository!
        var sut: CheckEmailExistByAccountIDUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = AuthRepositoryStub()
            sut = CheckEmailExistByAccountIDUseCaseImpl(authRepository: repo)
        }
        describe("CheckEmailExistByAccountIDUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.execute(req: .init(accountID: "", email: ""))
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
