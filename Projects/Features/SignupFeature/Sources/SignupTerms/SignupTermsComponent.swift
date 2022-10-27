import SwiftUI
import NeedleFoundation

public protocol SignupTermsDependency: Dependency {}

public final class SignupTermsComponent: Component<SignupTermsDependency> {
    public func makeView() -> some View {
        SignupTermsView(
            viewModel: .init()
        )
    }
}
