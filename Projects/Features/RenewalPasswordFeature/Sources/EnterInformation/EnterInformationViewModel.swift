import BaseFeature
import Combine
import DomainModule

final class EnterInformationViewModel: BaseViewModel {
    @Published var email = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var blockEmail = "082****@naver.com"
    @Published var id = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var name = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var isShowFoundEmail = false
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

    func returnEmailTextField(completion: @escaping () -> Void) {
        addCancellable(
            checkAccountIDIsExistUseCase.execute(id: id)
        ) { [weak self] email in
            self?.blockEmail = email
            self?.isShowFoundEmail = true
            completion()
        }
    }
}
