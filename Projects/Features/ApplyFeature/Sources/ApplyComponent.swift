import SwiftUI
import NeedleFoundation

public protocol ApplyDependency: Dependency {}

public final class ApplyComponent: Component<ApplyDependency> {
    public func makeView() -> some View {
        Text("Text")
    }
}
