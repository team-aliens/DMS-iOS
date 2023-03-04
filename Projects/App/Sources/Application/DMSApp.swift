import SwiftUI
import BaseFeature
import KeychainModule

@main
struct DMSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var appState = AppState(sceneFlow: .splash, features: .init())
    private let keychain: any Keychain

    init() {
        registerProviderFactories()
        self.keychain = KeychainImpl()
        appDelegate.keychain = keychain
    }

    var body: some Scene {
        WindowGroup {
            AppComponent(keychain: keychain).makeRootView()
                .environmentObject(appState)
        }
    }
}
