import BaseFeature
import Combine
import DomainModule

final class AuthenticationCodeViewModel: BaseViewModel {

    @Published var schoolID = ""
    @Published var schoolCode = ""

    @Published var isOnAutoSignup = true
    @Published var isNavigateCheckSchool = false
    @Published var isSuccessAuthenticationCode = false
    var isSigninButtonEnabled: Bool {
        !schoolCode.isEmpty
    }

    private let checkSchoolCodeUseCase: any CheckSchoolCodeUseCase

    public init(checkSchoolCodeUseCase: any CheckSchoolCodeUseCase) {
        self.checkSchoolCodeUseCase = checkSchoolCodeUseCase
    }

    func verifyAuthCodeButtonDidTap() {
        guard isSigninButtonEnabled else { return }
        addCancellable(
            checkSchoolCodeUseCase.execute(
                schoolID: schoolID,
                code: schoolCode)) { [weak self] _ in
            self?.isNavigateCheckSchool = true
        }
    }
}
