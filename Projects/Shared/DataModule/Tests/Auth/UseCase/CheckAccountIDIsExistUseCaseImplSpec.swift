import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class CheckAccountIDIsExistUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: AuthRepository!
        var sut: CheckAccountIDIsExistUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = AuthRepositoryStub()
            sut = CheckAccountIDIsExistUseCaseImpl(authRepository: repo)
        }
        describe("CheckAccountIDIsExistUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행하고, abc******@gmail.com가 response로 온다") {
                    var success: Void?
                    var res: String?
                    sut.execute(id: "")
                        .sink { _ in } receiveValue: { email in
                            success = ()
                            res = email
                        }
                        .store(in: &bag)
                    expect { success }.toNotEventually(beNil())
                    expect { success }.toEventually(beVoid())
                    expect { res }.toNotEventually(beNil())
                    expect { res }.toEventually(equal("abc******@gmail.com"))
                }
            }
        }
    }
}
