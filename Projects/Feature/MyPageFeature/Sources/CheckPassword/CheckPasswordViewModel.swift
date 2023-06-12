import BaseFeature
import Combine
import UsersDomainInterface
import UtilityModule

final class CheckPasswordViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { resettingError() }
    }
    @Published var isPasswordRegexError = false
    @Published var isSuccessCheckPassword = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    var isCheckPasswordEnabled: Bool {
        !password.isEmpty
    }

    private let compareCurrentPasswordUseCase: any CompareCurrentPasswordUseCase

    public init(
        compareCurrentPasswordUseCase: any CompareCurrentPasswordUseCase
    ) {
        self.compareCurrentPasswordUseCase = compareCurrentPasswordUseCase
    }

    func checkPasswordButtonDidTap() {
        guard isCheckPasswordEnabled else {
            return
        }

        let passwordExpression = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,20}$"
        guard password ~= passwordExpression else {
            isPasswordRegexError = true
            return
        }

        addCancellable(
            compareCurrentPasswordUseCase.execute(password: password)
        ) { [weak self] _ in
            self?.isSuccessCheckPassword = true
        } onReceiveError: { [weak self] _ in
            self?.isShowingToast = true
        }
    }

    func resettingError() {
        isPasswordRegexError = false
    }
}
