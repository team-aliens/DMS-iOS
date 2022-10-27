import SwiftUI
import NeedleFoundation

public protocol SignupProfileImageDependency: Dependency {}

public final class SignupProfileImageComponent: Component<SignupProfileImageDependency> {
    public func makeView() -> some View {
        SignupProfileImageView(
            viewModel: .init()
        )
    }
}
