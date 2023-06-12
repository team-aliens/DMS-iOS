import SwiftUI
import NeedleFoundation
import SignupFeatureInterface

public protocol SignupPasswordDependency: Dependency {
    var signupProfileImageFactory: any SignupProfileImageFactory { get }
}

public final class SignupPasswordComponent: Component<SignupPasswordDependency>, SignupPasswordFactory {
    public func makeView(signupPasswordParam: SignupPasswordParam) -> some View {
        SignupPasswordView(
            viewModel: .init(
                signupPasswordParam: signupPasswordParam
            ),
            signupProfileImageFactory: self.dependency.signupProfileImageFactory
        )
    }
}
