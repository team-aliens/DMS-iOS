import Combine
import SwiftUI

final class MVIContainer<Intent, Model>: ObservableObject {
    let intent: Intent
    @Published var model: Model

    private var bag = Set<AnyCancellable>()

    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model

        modelChangePublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: self.objectWillChange.send)
            .store(in: &bag)
    }
}
