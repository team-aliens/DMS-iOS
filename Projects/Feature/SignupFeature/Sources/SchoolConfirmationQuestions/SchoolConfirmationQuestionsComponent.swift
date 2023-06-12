import SchoolDomainInterface
import NeedleFoundation
import SwiftUI
import SignupFeatureInterface

public protocol SchoolConfirmationQuestionsDependency: Dependency {
    var checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase { get }
    var fetchSchoolQuestionUseCase: any FetchSchoolQuestionUseCase { get }
    var signupEmailVerifyFactory: any SignupEmailVerifyFactory { get }
}

public final class SchoolConfirmationQuestionsComponent:
    Component<SchoolConfirmationQuestionsDependency>, SchoolConfirmationQuestionsFactory {
    public func makeView(schoolConfirmationQuestionsParam: SchoolConfirmationQuestionsParam) -> some View {
        SchoolConfirmationQuestionsView(
            viewModel: .init(
                checkSchoolQuestionUseCase: self.dependency.checkSchoolQuestionUseCase,
                fetchSchoolQuestionUseCase: self.dependency.fetchSchoolQuestionUseCase,
                schoolConfirmationQuestionsParam: schoolConfirmationQuestionsParam
            ),
            signupEmailVerifyFactory: self.dependency.signupEmailVerifyFactory
        )
    }
}
