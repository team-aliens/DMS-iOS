import BaseFeature
import Combine
import AuthDomainInterface

final class SigninViewModel: BaseViewModel {
    @Published var id = ""
    @Published var password = ""
    @Published var isOnAutoSignin = true
    @Published var isSuccessSignin = false
    @Published var dmsFeatures: DmsFeatures?

    var isSigninEnabled: Bool {
        !id.isEmpty && !password.isEmpty
    }

    private let signinUseCase: any SigninUseCase

    public init(signinUseCase: any SigninUseCase) {
        self.signinUseCase = signinUseCase
    }

    func signinButtonDidTap() {
        guard isSigninEnabled else { return }
        addCancellable(
            signinUseCase.execute(
                req: .init(
                    accountID: id,
                    password: password
                )
            )
        ) { [weak self] feature in
            self?.dmsFeatures = feature
            self?.isSuccessSignin = true
        }
    }
}
