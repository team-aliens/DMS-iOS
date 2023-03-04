import SwiftUI

struct MainFactory {
    func makeView() -> some View {
        let model = MainModel()
        let intent = MainIntent(model: model)
        let container = MVIContainer(
            intent: intent as MainIntentProtocol,
            model: model as MainStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return MainView(container: container)
    }
}
