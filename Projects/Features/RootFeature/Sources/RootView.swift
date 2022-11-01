import BaseFeature
import SwiftUI
import SigninFeature
import MainTabFeature

struct RootView: View {
    @EnvironmentObject var appState: AppState

    private let signinComponent: SigninComponent
    private let mainTabComponent: MainTabComponent

    public init(
        signinComponent: SigninComponent,
        mainTabComponent: MainTabComponent
    ) {
        self.signinComponent = signinComponent
        self.mainTabComponent = mainTabComponent
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
                VStack {
                    Text("대충 스플래시")
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        appState.sceneFlow = .auth
                    }
                }
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
