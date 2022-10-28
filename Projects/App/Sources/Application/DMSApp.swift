import SwiftUI
import DesignSystem
import BaseFeature
import FindIDFeature
import SigninFeature
import SignupFeature

@main
struct DMSApp: App {
    @StateObject var appState = AppState(sceneFlow: .splash, features: .init())
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                .environmentObject(appState)
        }
    }
}
