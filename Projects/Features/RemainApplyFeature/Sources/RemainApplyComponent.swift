import SwiftUI
import NeedleFoundation

public protocol RemainApplyDependency: Dependency {}

public final class RemainApplyComponent: Component<RemainApplyDependency> {
    public func makeView() -> some View {
        RemainApplyView(viewModel: RemainApplyViewModel())
    }
}
