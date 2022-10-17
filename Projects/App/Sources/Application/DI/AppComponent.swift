import NeedleFoundation
import SwiftUI
import SigninFeature

public final class AppComponent: BootstrapComponent {
    public func makeRootView() -> some View {
        Text("Testing")
    }
}

public extension AppComponent {
    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }
}
