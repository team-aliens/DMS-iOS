import BaseFeature
import Combine
import DomainModule

final class EnterInformationViewModel: BaseViewModel {
    @Published var email = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var blockEmail = ""
    @Published var id = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var name = "" {
        didSet { isErrorOcuured = false }
    }
    @Published var isShowFoundEmail = false
    @Published var isNavigateAuthenticationEmail = false
    @Published var idTextFieldEnabled = false

    var isNextButtonEnabled: Bool {
        id.isEmpty
    }

    private let checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase

    public init(
        checkAccountIDIsExistUseCase: any CheckAccountIDIsExistUseCase
    ) {
        self.checkAccountIDIsExistUseCase = checkAccountIDIsExistUseCase
    }

    func enterInfoDidComplete() {
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
