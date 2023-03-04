import SwiftUI
import BaseFeature

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
