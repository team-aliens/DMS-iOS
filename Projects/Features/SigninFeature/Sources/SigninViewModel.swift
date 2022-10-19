import BaseFeature
import Combine
import DomainModule

final class SigninViewModel: BaseViewModel {
    @Published var id = ""
    @Published var password = ""
    @Published var isOnAutoSignin = true
    @Published var isNavigateSignup = false

    private let signinUseCase: any SigninUseCase

    public init(signinUseCase: any SigninUseCase) {
        self.signinUseCase = signinUseCase
    }

    func signinButtonDidTap() {
        addCancellable(signinUseCase.execute(req: .init(accountID: id, password: password))) { [weak self] _ in
            self?.isErrorOcuured = true
            self?.errorMessage = "아이디 또는 비밀번호를 확인해주세요"
        }
    }
}
