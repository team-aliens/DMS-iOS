import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SignupDependency: Dependency {
    var checkSchoolCodeUseCase: any CheckSchoolCodeUseCase { get }
}

public final class SignupComponent: Component<SignupDependency> {
    public func makeView() -> some View {
        AuthenticationCodeView(
            viewModel: .init(
                checkSchoolCodeUseCase: dependency.checkSchoolCodeUseCase
            )
        )
    }
}
