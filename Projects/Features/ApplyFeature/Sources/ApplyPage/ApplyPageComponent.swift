import SwiftUI
import NeedleFoundation

public protocol ApplyPageDependency: Dependency {}

public final class ApplyPageComponent: Component<ApplyPageDependency> {
    public func makeView() -> some View {
        ApplyPageView(viewModel: ApplyPageViewModel())
    }
}
