import SwiftUI
import DesignSystem

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
