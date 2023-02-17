import SwiftUI
import NeedleFoundation

public protocol StayApplyDependency: Dependency {}

public final class StayApplyComponent: Component<StayApplyDependency> {
    public func makeView() -> some View {
        StayApplyView(viewModel: StayApplyViewModel())
    }
}
