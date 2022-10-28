import BaseFeature
import SwiftUI
import SigninFeature
import MainTabFeature
import Utility

struct RootView: View {
    @AppStorage(StorageKeys.sceneFlow.rawValue) var sceneFlow: SceneFlow = .auth
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
            switch sceneFlow {
            case .auth:
                signinComponent.makeView()

            case .main:
                mainTabComponent.makeView()

            case .splash:
                VStack {
                    Text("대충 스플래시")
                }
            }
        }
    }
}
