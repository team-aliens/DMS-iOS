import BaseFeature
import Combine
import DomainModule

final class SchoolCodeViewModel: BaseViewModel {
    @Published var schoolCode = ""
    @Published var isDisabled = true

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
                code: schoolCode
            )
        ) { [weak self] _ in
            self?.isNavigateCheckSchool = true
        }
    }
    func checkIsEmptyAuthCode() {
        isDisabled = 8 != schoolCode.count
    }
}
