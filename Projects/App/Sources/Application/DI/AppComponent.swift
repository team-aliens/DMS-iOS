import NeedleFoundation
import SwiftUI
import KeychainModule
import SigninFeature

public final class AppComponent: BootstrapComponent {
    public func makeRootView() -> some View {
        Text("Testing")
    }

    public var keychain: any Keychain {
        KeychainImpl()
    }
}

public extension AppComponent {
    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }
}
