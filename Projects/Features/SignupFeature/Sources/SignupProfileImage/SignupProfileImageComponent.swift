import SwiftUI
import NeedleFoundation

public protocol SignupProfileImageDependency: Dependency {
    var signupTermsComponent: SignupTermsComponent { get }
}

public final class SignupProfileImageComponent: Component<SignupProfileImageDependency> {
    public func makeView(signupProfileImageParam: SignupProfileImageParam) -> some View {
        SignupProfileImageView(
            viewModel: .init(
                signupProfileImageParam: signupProfileImageParam
            ),
            signupTermsComponent: self.dependency.signupTermsComponent
        )
    }
}
