import DesignSystem
import SwiftUI
import BaseFeature

struct SplashView: View {
    @StateObject var viewModel: SplashViewModel
    @EnvironmentObject var appState: AppState

    init(
        viewModel: SplashViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {}
            .onAppear {
                viewModel.onAppear { features in
                    appState.features.mealService = features.mealService
                    appState.features.noticeService = features.noticeService
                    appState.features.pointService = features.pointService
                    appState.features.remainService = features.remainService
                    appState.features.studyRoomService = features.studyRoomService
                    appState.sceneFlow = .main
                } onError: { _ in
                    appState.sceneFlow = .auth
                }
            }
    }
}
