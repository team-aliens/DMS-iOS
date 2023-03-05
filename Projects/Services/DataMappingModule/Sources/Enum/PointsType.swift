import Foundation

public enum PointsType: String, CaseIterable {
    case all = "ALL"
    case bonus = "BONUS"
    case minus = "MINUS"

    public var display: String {
        switch self {
        case .all:
            return "전체"
        case .bonus:
            return "상점"
        case .minus:
            return "벌점"
        }
    }
}
