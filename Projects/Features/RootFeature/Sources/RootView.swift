import BaseFeature
import SwiftUI
import Utility

struct RootView: View {
    @AppStorage(StorageKeys.sceneFlow.rawValue) var sceneFlow: SceneFlow = .splash
    @StateObject var dmsFeaturesObject = DmsFeaturesObject(
        features: .init(mealService: false, noticeService: false, pointService: false)
    )

    var body: some View {
        Text("Hello, World!")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
