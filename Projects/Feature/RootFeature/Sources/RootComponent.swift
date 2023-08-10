import BaseFeature
import NeedleFoundation
import SwiftUI
import SigninFeatureInterface
import MainTabFeatureInterface
import SplashFeatureInterface

public protocol RootDependency: Dependency {
    var signinFactory: any SigninFactory { get }
    var mainTabFactory: any MainTabFactory { get }
    var splashFactory: any SplashFactory { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            signinFactory: self.dependency.signinFactory,
            mainTabFactory: self.dependency.mainTabFactory,
            splashFactory: self.dependency.splashFactory
        )
    }
}
