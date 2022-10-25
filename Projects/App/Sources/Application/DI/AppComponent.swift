import NeedleFoundation
import SwiftUI
import KeychainModule

import SignupFeature

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
    var schoolCodeComponent: SchoolCodeComponent {
        SchoolCodeComponent(parent: self)
    }
    var findIDComponent: FindIDComponent {
        FindIDComponent(parent: self)
    }
    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }
}
