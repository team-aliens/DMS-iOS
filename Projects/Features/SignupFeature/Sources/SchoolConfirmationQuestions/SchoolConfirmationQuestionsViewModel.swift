import BaseFeature
import Combine
import DomainModule

final class SchoolConfirmationQuestionsViewModel: BaseViewModel {
    @Published var id = ""
    @Published var answer = ""
    @Published var isDisabled = true
    @Published var isNavigateCheckConfirmationQuestion = false

    var isSignupButtonEnabled: Bool {
        !id.isEmpty
    }

    private let checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase

    public init(checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase) {
        self.checkSchoolQuestionUseCase = checkSchoolQuestionUseCase
    }

    func confirmButtonDidTap() {
        guard isSignupButtonEnabled else { return }
        addCancellable(
            checkSchoolQuestionUseCase.execute(
                schoolID: id,
                answer: answer
            )
        ) { [weak self] _ in
            self?.isNavigateCheckConfirmationQuestion = true
        }
    }
}
