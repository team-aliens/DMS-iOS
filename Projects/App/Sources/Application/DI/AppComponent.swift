import NeedleFoundation
import SwiftUI
import KeychainModule

public final class AppComponent: BootstrapComponent {
    public func makeRootView() -> some View {
        Text("Testing")
    }

    public var keychain: any Keychain {
        KeychainImpl()
    }
}
