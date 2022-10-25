import NeedleFoundation
import SwiftUI

public protocol MainTabDependency: Dependency {}

public final class MainTabComponent: Component<MainTabDependency> {
    public func makeView() -> some View {
        MainTabView()
    }
}
