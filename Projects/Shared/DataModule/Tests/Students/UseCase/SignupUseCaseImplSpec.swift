import Quick
import Nimble
import DataModule
import DomainModule
import Combine

final class SignupUseCaseImplSpec: QuickSpec {
    override func spec() {
        var repo: StudentsRepository!
        var sut: SignupUseCaseImpl!
        var bag = Set<AnyCancellable>()

        beforeEach {
            repo = StudentsRepositoryStub()
            sut = SignupUseCaseImpl(studentsRepository: repo)
        }
        describe("SignupUseCaseImpl에서") {
            context("execute()를 실행하면") {
                it("request를 성공적으로 실행한다.") {
                    var success: DmsFeatures?
                    sut.execute(
                        req: .init(
                            schoolCode: "",
                            schoolAnswer: "",
                            email: "",
                            authCode: "",
                            grade: 0,
                            classRoom: 0,
                            number: 0,
                            accountID: "",
                            password: "",
                            profileImageUrl: ""
                        )
                    )
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
