import BaseFeature
import SwiftUI
import SigninFeature
import MainTabFeature
import SplashFeature

struct RootView: View {
    @EnvironmentObject var appState: AppState

    private let signinComponent: SigninComponent
    private let mainTabComponent: MainTabComponent
    private let splashComponent: SplashComponent

    public init(
        signinComponent: SigninComponent,
        mainTabComponent: MainTabComponent,
        splashComponent: SplashComponent
    ) {
        self.signinComponent = signinComponent
        self.mainTabComponent = mainTabComponent
        self.splashComponent = splashComponent
    }

    var body: some View {
        ZStack {
            switch appState.sceneFlow {
            case .auth:
                signinComponent.makeView()
                    .environmentObject(appState)

            case .main:
                mainTabComponent.makeView()
                    .environmentObject(appState)

            case .splash:
                splashComponent.makeView()
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
