import SwiftUI
import NeedleFoundation

public protocol SignupPasswordDependency: Dependency {}

public final class SignupPasswordComponent: Component<SignupPasswordDependency> {
    public func makeView() -> some View {
        SignupPasswordView(
            viewModel: .init()
        )
    }
}
