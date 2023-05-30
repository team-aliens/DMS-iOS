import BaseFeature
import SwiftUI
import UtilityModule
import SigninFeatureInterface
import MainTabFeatureInterface
import SplashFeatureInterface

struct RootView: View {
    @EnvironmentObject var appState: AppState

    private let signinFactory: any SigninFactory
    private let mainTabFactory: any MainTabFactory
    private let splashFactory: any SplashFactory

    public init(
        signinFactory: any SigninFactory,
        mainTabFactory: any MainTabFactory,
        splashFactory: any SplashFactory
    ) {
        self.signinFactory = signinFactory
        self.mainTabFactory = mainTabFactory
        self.splashFactory = splashFactory
    }

    var body: some View {
        ZStack {
            switch appState.sceneFlow {
            case .auth:
                signinFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(appState)

            case .main:
                mainTabFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(appState)

            case .splash:
                splashFactory.makeView()
                    .eraseToAnyView()
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
