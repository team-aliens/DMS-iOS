import BaseFeature
import Combine
import DomainModule

final class SchoolConfirmationQuestionsViewModel: BaseViewModel {
    @Published var question = "질문을 가져오는 중입니다..!"
    @Published var answer = ""
    @Published var isNavigateSignupEmailVerify = false

    var isConfirmEnabled: Bool {
        !answer.isEmpty
    }

    private let checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase
    private let fetchSchoolQuestionUseCase: any FetchSchoolQuestionUseCase
    let schoolConfirmationQuestionsParam: SchoolConfirmationQuestionsParam

    public init(
        checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase,
        fetchSchoolQuestionUseCase: any FetchSchoolQuestionUseCase,
        schoolConfirmationQuestionsParam: SchoolConfirmationQuestionsParam
    ) {
        self.checkSchoolQuestionUseCase = checkSchoolQuestionUseCase
        self.fetchSchoolQuestionUseCase = fetchSchoolQuestionUseCase
        self.schoolConfirmationQuestionsParam = schoolConfirmationQuestionsParam
    }

    func onAppear() {
        addCancellable(
            fetchSchoolQuestionUseCase.execute(schoolID: schoolConfirmationQuestionsParam.schoolID)
        ) { [weak self] question in
            self?.question = question
        }
    }

    func confirmButtonDidTap() {
        guard isConfirmEnabled else { return }
        addCancellable(
            checkSchoolQuestionUseCase.execute(
                schoolID: schoolConfirmationQuestionsParam.schoolID,
                answer: answer
            )
        ) { [weak self] _ in
            self?.isNavigateSignupEmailVerify = true
        }
    }
}
