import Foundation

public enum TabFlow: Int {
    case home
    case apply
    case notice
    case myPage
}

public extension String {
    func toTabFlow() -> TabFlow {
        switch self {
        case "widget://deeplink?text=notice":
            return .notice
        case "widget://deeplink?text=point":
            return .myPage
        default:
            return .home
        }
    }
}
