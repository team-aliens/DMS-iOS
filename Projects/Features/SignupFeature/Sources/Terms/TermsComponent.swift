import SwiftUI
import NeedleFoundation

public protocol TermsDependency: Dependency {}

public final class TermsComponent: Component<TermsDependency> {
    public func makeView() -> some View {
        TermsView(
            viewModel: .init()
        )
    }
}
