import Foundation

final class MainModel: ObservableObject, MainStateProtocol {
    @Published var currentTab: MainTab = .meal
}

extension MainModel: MainActionProtocol {
    func tabChaged(tab: MainTab) {
        currentTab = tab
    }
}
