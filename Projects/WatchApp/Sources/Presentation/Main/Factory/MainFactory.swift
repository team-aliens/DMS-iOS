import SwiftUI

struct MainFactory {
    private let mealFactory: MealFactory
    private let noticeFactory: NoticeFactory

    init(
        mealFactory: MealFactory,
        noticeFactory: NoticeFactory
    ) {
        self.mealFactory = mealFactory
        self.noticeFactory = noticeFactory
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
            mealFactory: mealFactory,
            noticeFactory: noticeFactory
        )
    }
}
