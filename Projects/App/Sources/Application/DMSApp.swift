import SwiftUI
import DesignSystem
import FindIDFeature
@main
struct DMSApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppComponent().findIDComponent.makeView()
            }
        }
    }
}
