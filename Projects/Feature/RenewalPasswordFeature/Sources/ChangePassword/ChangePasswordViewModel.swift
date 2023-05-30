import BaseFeature
import Combine
import StudentsDomainInterface
import UtilityModule

final class ChangePasswordViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { resettingError() }
    }
    @Published var passwordCheck = "" {
        didSet { resettingError() }
    }
    @Published var isPasswordRegexError = false
    @Published var isPasswordMismatchedError = false
    @Published var isSuccessRenewalPassword = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    var isRenewalPasswordEnabled: Bool {
        !password.isEmpty && !passwordCheck.isEmpty
    }

    private let renewalPasswordUseCase: any RenewalPasswordUseCase
    let changePasswordParm: ChangePasswordParm

    public init(
        renewalPasswordUseCase: any RenewalPasswordUseCase,
        changePasswordParm: ChangePasswordParm
    ) {
        self.renewalPasswordUseCase = renewalPasswordUseCase
        self.changePasswordParm = changePasswordParm
    }

    func renewalPasswordButtonDidTap() {
        guard isRenewalPasswordEnabled else {
            return
        }

        let passwordExpression = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,20}$"
        guard password ~= passwordExpression else {
            isPasswordRegexError = true
            return
        }

        guard password == passwordCheck else {
            isPasswordMismatchedError = true
            return
        }
        addCancellable(
            renewalPasswordUseCase.execute(
                req: .init(
                    accountID: changePasswordParm.id,
                    name: changePasswordParm.name,
                    email: changePasswordParm.email,
                    authCode: changePasswordParm.authCode,
                    newPassword: password
                )
            )
        ) { [weak self] _ in
            self?.isSuccessRenewalPassword = true
        }
    }

    func resettingError() {
        isPasswordRegexError = false
        isPasswordMismatchedError = false
    }
}
