import BaseFeature
import NeedleFoundation
import SwiftUI
import SigninFeature
import MainTabFeature
import SplashFeature

public protocol RootDependency: Dependency {
    var signinComponent: SigninComponent { get }
    var mainTabComponent: MainTabComponent { get }
    var splashComponent: SplashComponent { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            signinComponent: self.dependency.signinComponent,
            mainTabComponent: self.dependency.mainTabComponent,
            splashComponent: self.dependency.splashComponent
        )
    }
}
