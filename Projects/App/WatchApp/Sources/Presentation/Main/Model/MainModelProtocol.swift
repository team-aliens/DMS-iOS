protocol MainStateProtocol {
    var currentTab: MainTab { get }
}

protocol MainActionProtocol: AnyObject {
    func tabChaged(tab: MainTab)
}
