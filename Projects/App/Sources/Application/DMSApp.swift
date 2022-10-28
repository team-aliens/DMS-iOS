import SwiftUI
import DesignSystem
import FindIDFeature
import SigninFeature
import SignupFeature
import Utility

@main
struct DMSApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
        }
    }
}
