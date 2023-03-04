import SwiftUI

struct MainFactory {
    private let mealFactory: MealFactory

    init(mealFactory: MealFactory) {
        self.mealFactory = mealFactory
    }

    func makeView() -> some View {
        let model = MainModel()
        let intent = MainIntent(model: model)
        let container = MVIContainer(
            intent: intent as MainIntentProtocol,
            model: model as MainStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MainView(
            container: container,
            mealFactory: mealFactory
        )
    }
}
