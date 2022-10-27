import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SchoolConfirmationQuestionsDependency: Dependency {
    var checkSchoolQuestionUseCase: any CheckSchoolQuestionUseCase { get }
}

public final class SchoolConfirmationQuestionsComponent: Component<SchoolConfirmationQuestionsDependency> {
    public func makeView() -> some View {
        SchoolConfirmationQuestionsView(
            viewModel: .init(
                checkSchoolQuestionUseCase: dependency.checkSchoolQuestionUseCase
            )
        )
    }
}
