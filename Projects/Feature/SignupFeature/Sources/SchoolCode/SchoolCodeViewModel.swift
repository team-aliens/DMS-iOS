import BaseFeature
import Combine
import SchoolDomainInterface

final class SchoolCodeViewModel: BaseViewModel {
    @Published var schoolCode = ""
    @Published var isNavigateSchoolQuestion = false
    @Published var schoolID = ""

    var isEnabledVerify: Bool {
        schoolCode.count == 8
    }

    private let checkSchoolCodeUseCase: any CheckSchoolCodeUseCase

    public init(checkSchoolCodeUseCase: any CheckSchoolCodeUseCase) {
        self.checkSchoolCodeUseCase = checkSchoolCodeUseCase
        super.init()

        addCancellable(
            $schoolCode.setFailureType(to: Error.self).eraseToAnyPublisher()
        ) { [weak self] code in
            if code.count == 8 {
                self?.verifyAuthCodeButtonDidTap()
            }
        }
    }

    func verifyAuthCodeButtonDidTap() {
        guard isEnabledVerify else { return }
        addCancellable(
            checkSchoolCodeUseCase.execute(
                code: schoolCode
            )
        ) { [weak self] id in
            self?.schoolID = id
            self?.isNavigateSchoolQuestion = true
        } onReceiveError: { [weak self] _ in
            self?.schoolCode = ""
        }
    }
}
