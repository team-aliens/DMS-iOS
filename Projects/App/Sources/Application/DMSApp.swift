import SwiftUI
import DesignSystem
import FindIDFeature
import SigninFeature

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
