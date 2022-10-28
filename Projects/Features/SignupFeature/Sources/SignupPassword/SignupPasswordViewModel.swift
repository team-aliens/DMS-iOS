import BaseFeature
import Combine
import Utility

final class SignupPasswordViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { resettingError() }
    }
    @Published var passwordCheck = "" {
        didSet { resettingError() }
    }
    @Published var isPasswordRegexError = false
    @Published var isPasswordMismatchedError = false
    @Published var isNavigateSignupProfileImage = false

    var isEnabledNextStep: Bool {
        !password.isEmpty && !passwordCheck.isEmpty
    }

    let signupPasswordParam: SignupPasswordParam

    init(signupPasswordParam: SignupPasswordParam) {
        self.signupPasswordParam = signupPasswordParam
    }

    func nextButtonDidTap() {
        guard isEnabledNextStep else {
            return
        }

        let passwordExpression = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,20}"
        guard password ~= passwordExpression else {
            isPasswordRegexError = true
            return
        }

        guard password == passwordCheck else {
            isPasswordMismatchedError = true
            return
        }
        isNavigateSignupProfileImage = true
    }

    func resettingError() {
        isPasswordRegexError = false
        isPasswordMismatchedError = false
    }
}
