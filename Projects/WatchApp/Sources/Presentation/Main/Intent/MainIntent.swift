import Foundation

final class MainIntent: MainIntentProtocol {
    private weak var model: (any MainActionProtocol)?

    init(model: any MainActionProtocol) {
        self.model = model
    }

    func tabChanged(tab: MainTab) {
        model?.tabChaged(tab: tab)
    }
}
