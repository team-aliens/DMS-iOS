import BaseFeature
import Combine
import DomainModule

final class SchoolConfirmationQuestionsViewModel: BaseViewModel {
    @Published var id = ""
    @Published var answer = ""
    @Published var isDisabled = true

    var isConfirmButtonEnabled: Bool {
        !answer.isEmpty
    }

    private let checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase
    let schoolConfirmationQuestionsParam: SchoolConfirmationQuestionsParam

    public init(
        checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase,
        schoolConfirmationQuestionsParam: SchoolConfirmationQuestionsParam
    ) {
        self.checkSchoolQuestionUseCase = checkSchoolQuestionUseCase
        self.schoolConfirmationQuestionsParam = schoolConfirmationQuestionsParam
    }

    func confirmButtonDidTap() {
        guard isConfirmButtonEnabled else { return }
        addCancellable(
            checkSchoolQuestionUseCase.execute(
                schoolID: id,
                answer: answer
            )
        ) { _ in
        }
    }
}
