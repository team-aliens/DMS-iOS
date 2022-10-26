import SwiftUI
import NeedleFoundation

public protocol SignupEmailVerifyDependency: Dependency {}

public final class SignupEmailVerifyComponent: Component<SignupEmailVerifyDependency> {
    public func makeView() -> some View {
        SignupEmailVerifyView(
            viewModel: .init()
        )
    }
}
