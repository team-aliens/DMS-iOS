import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SchoolConfirmationQuestionsDependency: Dependency {
    var checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase { get }
    var fetchSchoolQuestionUseCase: any FetchSchoolQuestionUseCase { get }
    var signupEmailVerifyComponent: SignupEmailVerifyComponent { get }
}

public final class SchoolConfirmationQuestionsComponent: Component<SchoolConfirmationQuestionsDependency> {
    public func makeView(schoolConfirmationQuestionsParam: SchoolConfirmationQuestionsParam) -> some View {
        SchoolConfirmationQuestionsView(
            viewModel: .init(
                checkSchoolQuestionUseCase: self.dependency.checkSchoolQuestionUseCase,
                fetchSchoolQuestionUseCase: self.dependency.fetchSchoolQuestionUseCase,
                schoolConfirmationQuestionsParam: schoolConfirmationQuestionsParam
            ),
            signupEmailVerifyComponent: self.dependency.signupEmailVerifyComponent
        )
    }
}
