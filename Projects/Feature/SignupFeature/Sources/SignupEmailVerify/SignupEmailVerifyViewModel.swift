import BaseFeature
import Combine
import StudentsDomainInterface
import UtilityModule

final class SignupEmailVerifyViewModel: BaseViewModel {
    @Published var email = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var isNavigateSignupEmailAuthCodeVerify = false
    var isSendEnabled: Bool {
        !email.isEmpty
    }

    private let checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase
    let signupEmailVerifyParam: SignupEmailVerifyParam

    public init(
        checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase,
        signupEmailVerifyParam: SignupEmailVerifyParam
    ) {
        self.checkDuplicateEmailUseCase = checkDuplicateEmailUseCase
        self.signupEmailVerifyParam = signupEmailVerifyParam
    }

    func sendButtonDidTap() {
        let emailExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        guard
            email ~= emailExpression,
            isSendEnabled
        else {
            isErrorOcuured = true
            errorMessage = "올바른 이메일 형식이 아닙니다."
            return
        }
        addCancellable(
            checkDuplicateEmailUseCase.execute(email: email)
        ) { [weak self] _ in
            self?.isNavigateSignupEmailAuthCodeVerify = true
        }
    }
}
