import SwiftUI
import DesignSystem
import FindIDFeature
import SigninFeature
import SignupFeature

@main
struct DMSApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().mainTabComponent.makeView()
                .environment(\.colorScheme, .light)
        }
    }
}
