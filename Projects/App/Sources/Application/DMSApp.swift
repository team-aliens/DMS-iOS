import SwiftUI
import DesignSystem
import BaseFeature
import FindIDFeature
import SigninFeature
import SignupFeature

@main
struct DMSApp: App {
    @StateObject var sceneFlowState = SceneFlowState(sceneFlow: .splash)
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().makeRootView()
                .environmentObject(sceneFlowState)
        }
    }
}
