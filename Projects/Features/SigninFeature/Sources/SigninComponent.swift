import DomainModule
import FindIDFeature
import NeedleFoundation
import SwiftUI
import SignupFeature

public protocol SigninDependency: Dependency {
    var signinUseCase: any SigninUseCase { get }
    var schoolCodeComponent: SchoolCodeComponent { get }
    var findIDComponent: FindIDComponent { get }
}

public final class SigninComponent: Component<SigninDependency> {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(
                signinUseCase: self.dependency.signinUseCase
            ),
            schoolCodeComponent: self.dependency.schoolCodeComponent,
            findIDComponent: self.dependency.findIDComponent
        )
    }
}
