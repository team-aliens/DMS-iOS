import SwiftUI
import NeedleFoundation
import SignupFeatureInterface

public protocol SignupPasswordDependency: Dependency {
    var signupProfileImageComponent: SignupProfileImageComponent { get }
}

public final class SignupPasswordComponent: Component<SignupPasswordDependency>, SignupPasswordFactory {
    public func makeView(signupPasswordParam: SignupPasswordParam) -> some View {
        SignupPasswordView(
            viewModel: .init(
                signupPasswordParam: signupPasswordParam
            ),
            signupProfileImageComponent: self.dependency.signupProfileImageComponent
        )
    }
}
