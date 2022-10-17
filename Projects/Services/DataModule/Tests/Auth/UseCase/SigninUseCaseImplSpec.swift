import Quick
import Nimble
import Combine
import DataModule
import DomainModule

final class SigninUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: AuthRepository!
        var sut: SigninUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = AuthRepositoryStub()
            sut = SigninUseCaseImpl(authRepository: repo)
        }
        describe("SigninUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.execute(req: .init(accountID: "", password: ""))
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
