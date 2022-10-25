import NeedleFoundation
import SwiftUI
import KeychainModule
import FindIDFeature
import SigninFeature
import MainTabFeature

public final class AppComponent: BootstrapComponent {
    public func makeRootView() -> some View {
        Text("Testing")
    }

    public var keychain: any Keychain {
        KeychainImpl()
    }
}

// MARK: - Auth
public extension AppComponent {
    var findIDComponent: FindIDComponent {
        FindIDComponent(parent: self)
    }
    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }
}

// MARK: - Main
public extension AppComponent {
    var mainTabComponent: MainTabComponent {
        MainTabComponent(parent: self)
    }
}
