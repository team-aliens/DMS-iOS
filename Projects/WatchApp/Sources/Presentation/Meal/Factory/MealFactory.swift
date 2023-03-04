import SwiftUI
import WatchRestAPIModule

struct MealFactory {
    private let mealRepository: any MealRepository

    init(mealRepository: any MealRepository){
        self.mealRepository = mealRepository
    }

    func makeView() -> some View {
        let model = MealModel()
        let intent = MealIntent(model: model, mealRepository: mealRepository)
        let container = MVIContainer(
            intent: intent as MealIntentProtocol,
            model: model as MealStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MealView(container: container)
    }
}
