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
        }
    }
}
