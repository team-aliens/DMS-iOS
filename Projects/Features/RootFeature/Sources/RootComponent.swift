import NeedleFoundation
import SwiftUI

public protocol RootDependency: Dependency {}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView()
    }
}
