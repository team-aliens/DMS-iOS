import BaseFeature
import Combine
import DomainModule
import Utility

final class SignupEmailVerifyViewModel: BaseViewModel {
    @Published var email = "" {
        didSet { isErrorOcuured = false }
    }

    private let checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase

    public init(
        checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase
    ) {
        self.checkDuplicateEmailUseCase = checkDuplicateEmailUseCase
    }

    func sendButtonDidTap() {
        let emailExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        guard email ~= emailExpression else {
            isErrorOcuured = true
            errorMessage = "올바른 이메일 형식이 아닙니다."
            return
        }
        addCancellable(checkDuplicateEmailUseCase.execute(email: email)) { _ in }
    }
}
