import Quick
import Nimble
import Combine
import AuthDomainInterface

@testable import SigninFeature

// swiftlint: disable function_body_length
final class SigninViewModelSpec: QuickSpec {
    override func spec() {
        var signinUseCase: SigninUseCase!
        var sut: SigninViewModel!

        beforeEach {
            signinUseCase = SigninUseCaseFake()
            sut = SigninViewModel(signinUseCase: signinUseCase)
        }
        describe("SigninViewModel에서") {
            context("유저가 아무것도 입력하지 않은 상태라면") {
                it("isSigninButtonEnabled은 false이다.") {
                    expect { sut.id }.to(beEmpty())
                    expect { sut.password }.to(beEmpty())
                    expect { sut.isSigninEnabled }.to(beFalse())
                }
            }
            context("유저가 ID만 입력했다면") {
                beforeEach {
                    sut.id = "A"
                }
                it("isSigninButtonEnabled은 false이다.") {
                    expect { sut.id }.toNot(beEmpty())
                    expect { sut.password }.to(beEmpty())
                    expect { sut.isSigninEnabled }.to(beFalse())
                }
            }
            context("유저가 Password만 입력했다면") {
                beforeEach {
                    sut.password = "A"
                }
                it("isSigninButtonEnabled은 false이다.") {
                    expect { sut.id }.to(beEmpty())
                    expect { sut.password }.toNot(beEmpty())
                    expect { sut.isSigninEnabled }.to(beFalse())
                }
            }
            context("유저가 ID와 Password를 모두 입력했다면") {
                beforeEach {
                    sut.id = "A"
                    sut.password = "A"
                }
                it("isSigninButtonEnabled은 true이다.") {
                    expect { sut.id }.toNot(beEmpty())
                    expect { sut.password }.toNot(beEmpty())
                    expect { sut.isSigninEnabled }.to(beTrue())
                }
            }
            context("유저가 ID와 Password를 알맞게 입력하고 로그인을 시도한다면") {
                beforeEach {
                    sut.id = "baekteun"
                    sut.password = "baekteun"
                    sut.signinButtonDidTap()
                }
                it("isSuccessSignin이 true이다.") {
                    expect { sut.isSuccessSignin }.toEventually(beTrue())
                }
            }
            context("유저가 ID와 Password중 하나라도 알맞지 않게 입력하고 로그인을 시도한다면") {
                beforeEach {
                    sut.id = "ASDF"
                    sut.password = "ASDF"
                    sut.signinButtonDidTap()
                }
                it("isSuccessSignin은 false이다") {
                    expect { sut.isSuccessSignin }.toEventually(beFalse())
                }
                it("isErrorOcuured는 true이다") {
                    expect { sut.isErrorOcuured }.toEventually(beTrue())
                }
                it("errorMessage는 '아이디 또는 비밀번호를 확인해주세요.'가 나온다") {
                    expect { sut.errorMessage }.toEventually(equal("아이디 또는 비밀번호를 확인해주세요."))
                }
            }
        }
    }
}
