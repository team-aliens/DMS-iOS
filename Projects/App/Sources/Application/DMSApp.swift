import SwiftUI
import DesignSystem
import SigninFeature

@main
struct DMSApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppComponent().signinComponent.makeView()
            }
        }
    }
}
