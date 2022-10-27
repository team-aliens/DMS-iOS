import BaseFeature
import Combine
import DomainModule

final class SchoolCodeViewModel: BaseViewModel {
    @Published var schoolCode = ""
    @Published var isNavigateCheckSchool = false

    var isEnabledVerify: Bool {
        schoolCode.count == 8
    }

    private let checkSchoolCodeUseCase: any CheckSchoolCodeUseCase

    public init(checkSchoolCodeUseCase: any CheckSchoolCodeUseCase) {
        self.checkSchoolCodeUseCase = checkSchoolCodeUseCase
    }

    func verifyAuthCodeButtonDidTap() {
        guard isEnabledVerify else { return }
        addCancellable(
            checkSchoolCodeUseCase.execute(
                code: schoolCode
            )
        ) { [weak self] _ in
            self?.isNavigateCheckSchool = true
        }
    }
}
