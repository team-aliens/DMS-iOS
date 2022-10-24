import DomainModule
import NeedleFoundation
import SwiftUI

public protocol AuthenticationCodeDependency: Dependency {
    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase { get }
}

public final class AuthenticationCodeComponent: Component<AuthenticationCodeDependency> {
    public func makeView() -> some View {
        SchoolCodeView(
            viewModel: .init(
                checkSchoolCodeUseCase: dependency.checkSchoolCodeUseCase
            )
        )
    }
}
