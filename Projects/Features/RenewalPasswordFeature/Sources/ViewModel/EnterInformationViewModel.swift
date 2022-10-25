import BaseFeature
import Combine
import DomainModule

final class EnterInformationViewModel: BaseViewModel {

    @Published var email = ""
    @Published var blockEmail = "082****@naver.com"
    @Published var id = ""
    @Published var name = ""
    @Published var isShow = false

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

    }

    func returnEmailTextField() {
        isShow.toggle()  // 임시
    }
}
