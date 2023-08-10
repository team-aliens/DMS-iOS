import BaseFeature
import Combine
import UsersDomainInterface
import UtilityModule

final class ModifyPasswordViewModel: BaseViewModel {
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

    var iChangePasswordEnabled: Bool {
        !password.isEmpty && !passwordCheck.isEmpty
    }

    let currentPassword: String
    private let changePasswordUseCase: any ChangePasswordUseCase

    public init(
        changePasswordUseCase: any ChangePasswordUseCase,
        currentPassword: String
    ) {
        self.changePasswordUseCase = changePasswordUseCase
        self.currentPassword = currentPassword
    }
    func changePasswordButtonDidTap() {
        guard iChangePasswordEnabled else {
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
            changePasswordUseCase.execute(
                req: .init(
                    currentPassword: currentPassword,
                    newPassword: password
                )
            )
        ) { [weak self] _ in
            self?.isSuccessRenewalPassword = true
        } onReceiveError: { [weak self] _ in
            self?.isShowingToast = true
        }
    }

    func resettingError() {
        isPasswordRegexError = false
        isPasswordMismatchedError = false
    }

}
