import BaseFeature
import NeedleFoundation
import SwiftUI
import SigninFeature
import MainTabFeature

public protocol RootDependency: Dependency {
    var signinComponent: SigninComponent { get }
    var mainTabComponent: MainTabComponent { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            signinComponent: self.dependency.signinComponent,
            mainTabComponent: self.dependency.mainTabComponent
        )
    }
}
