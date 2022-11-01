import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SchoolCodeDependency: Dependency {
    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase { get }
    var schoolConfirmationQuestionsComponent: SchoolConfirmationQuestionsComponent { get }
}

public final class SchoolCodeComponent: Component<SchoolCodeDependency> {
    public func makeView() -> some View {
        SchoolCodeView(
            viewModel: .init(
                checkSchoolCodeUseCase: self.dependency.checkSchoolCodeUseCase
            ),
            schoolConfirmationQuestionsComponent: self.dependency.schoolConfirmationQuestionsComponent
        )
    }
}
