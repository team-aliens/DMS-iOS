import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class SendAuthCodeUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: AuthRepository!
        var sut: SendAuthCodeUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = AuthRepositoryStub()
            sut = SendAuthCodeUseCaseImpl(authRepository: repo)
        }
        describe("SendAuthCodeUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: Void?
                    sut.execute(req: .init(email: "", type: .signup))
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
