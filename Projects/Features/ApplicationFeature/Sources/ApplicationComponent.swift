import SwiftUI
import NeedleFoundation

public protocol ApplicationDependency: Dependency {}

public final class ApplicationComponent: Component<ApplicationDependency> {
    public func makeView() -> some View {
        Text("Text")
    }
}

