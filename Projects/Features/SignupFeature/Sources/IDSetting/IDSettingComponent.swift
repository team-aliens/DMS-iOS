import NeedleFoundation
import SwiftUI

public protocol IDSettingDependency: Dependency {}

public final class IDSettingComponent: Component<IDSettingDependency> {
    public func makeView() -> some View {
        IDSettingView(
            viewModel: .init()
        )
    }
}
