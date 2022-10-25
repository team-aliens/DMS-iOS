import NeedleFoundation
import SwiftUI
import HomeFeature

public protocol MainTabDependency: Dependency {
    var homeComponent: HomeComponent { get }
}

public final class MainTabComponent: Component<MainTabDependency> {
    public func makeView() -> some View {
        MainTabView(
            homeComponent: dependency.homeComponent
        )
    }
}
