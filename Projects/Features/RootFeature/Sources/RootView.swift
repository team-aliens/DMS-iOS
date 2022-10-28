import BaseFeature
import SwiftUI
import SigninFeature
import MainTabFeature

struct RootView: View {
    @EnvironmentObject var sceneFlowState: SceneFlowState
    @StateObject var dmsFeaturesObject = DmsFeaturesObject(
        features: .init(mealService: false, noticeService: false, pointService: false)
    )

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
            switch sceneFlowState.sceneFlow {
            case .auth:
                signinComponent.makeView()
                    .environmentObject(sceneFlowState)

            case .main:
                mainTabComponent.makeView()
                    .environmentObject(sceneFlowState)

            case .splash:
                VStack {
                    Text("대충 스플래시")
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        sceneFlowState.sceneFlow = .auth
                    }
                }
            }
        }
        .animation(.easeInOut, value: sceneFlowState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
