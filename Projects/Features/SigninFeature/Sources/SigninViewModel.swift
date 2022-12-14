import BaseFeature
import Combine
import DomainModule

final class SigninViewModel: BaseViewModel {
    @Published var id = ""
    @Published var password = ""
    @Published var isOnAutoSignin = true
    @Published var isSuccessSignin = false
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    var isSigninEnabled: Bool {
        !id.isEmpty && !password.isEmpty
    }

    private let signinUseCase: any SigninUseCase

    public init(signinUseCase: any SigninUseCase) {
        self.signinUseCase = signinUseCase
    }

    func signinButtonDidTap() {
        guard isSigninEnabled else { return }
        addCancellable(signinUseCase.execute(req: .init(accountID: id, password: password))) { [weak self] _ in
            self?.isSuccessSignin = true
        }
    }
}
