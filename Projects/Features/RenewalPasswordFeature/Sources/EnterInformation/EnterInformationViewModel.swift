import BaseFeature
import Combine
import DomainModule

final class EnterInformationViewModel: BaseViewModel {

    @Published var email = ""
    @Published var blockEmail = "082****@naver.com"
    @Published var id = ""
    @Published var name = ""
    @Published var isShow = false
    @Published var isNavigateAuthenticationEmail = false

    var isNextButtonEnabled: Bool {
        !email.isEmpty && !id.isEmpty && !name.isEmpty
    }

    private let checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase

    public init(
        checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase
    ) {
        self.checkAccountIDIsExistUseCase = checkAccountIDIsExistUseCase
    }

    func nextButtonDidTap() {
        self.isNavigateAuthenticationEmail = true
    }

    func returnEmailTextField() {
        addCancellable(
            checkAccountIDIsExistUseCase.execute(id: id)
        ) { [weak self] email in
            self?.blockEmail = email
            self?.isShow = true
        }
    }
}
