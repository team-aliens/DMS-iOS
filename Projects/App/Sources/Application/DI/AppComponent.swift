import NeedleFoundation
import SwiftUI
import KeychainModule
import FindIDFeature
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
    var findIDComponent: FindIDComponent {
        FindIDComponent(parent: self)
    }
    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }
}
