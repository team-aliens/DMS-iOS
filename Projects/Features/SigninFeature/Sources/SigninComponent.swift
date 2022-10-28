import DomainModule
import NeedleFoundation
import SwiftUI
import SignupFeature

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
    var schoolCodeComponent: SchoolCodeComponent { get }
}

public final class SigninComponent: Component<SigninDependency> {
    public func makeView() -> some View {
        NavigationView {
            SigninView(
                viewModel: .init(
                    signinUseCase: self.dependency.signinUseCase
                ),
                schoolCodeComponent: self.dependency.schoolCodeComponent
            )
        }
    }
}
