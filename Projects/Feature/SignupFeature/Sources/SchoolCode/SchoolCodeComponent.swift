import SchoolDomainInterface
import NeedleFoundation
import SignupFeatureInterface
import SwiftUI

public protocol SchoolCodeDependency: Dependency {
    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase { get }
    var schoolConfirmationQuestionsComponent: SchoolConfirmationQuestionsComponent { get }
}

public final class SchoolCodeComponent: Component<SchoolCodeDependency>, SchoolCodeFactory {
    public func makeView() -> some View {
        SchoolCodeView(
            viewModel: .init(
                checkSchoolCodeUseCase: self.dependency.checkSchoolCodeUseCase
            ),
            schoolConfirmationQuestionsComponent: self.dependency.schoolConfirmationQuestionsComponent
        )
    }
}
