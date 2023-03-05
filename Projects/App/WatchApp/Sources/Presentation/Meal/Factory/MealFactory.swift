import SwiftUI
import WatchRestAPIModule

struct MealFactory {
    private let mealRepository: any MealRepository
    private let watchSessionManager: WatchSessionManager

    init(
        mealRepository: any MealRepository,
        watchSessionManager: WatchSessionManager
    ) {
        self.mealRepository = mealRepository
        self.watchSessionManager = watchSessionManager
    }

    func makeView() -> some View {
        let model = MealModel()
        let intent = MealIntent(
            model: model,
            mealRepository: mealRepository,
            watchSessionManager: watchSessionManager
        )
        let container = MVIContainer(
            intent: intent as MealIntentProtocol,
            model: model as MealStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MealView(container: container)
    }
}
