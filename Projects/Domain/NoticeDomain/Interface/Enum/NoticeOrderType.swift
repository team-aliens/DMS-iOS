import Foundation

public enum NoticeOrderType: String, Codable {
    case new = "NEW"
    case old = "OLD"

    public var display: String {
        switch self {
        case .new:
            return "최신순"
        case .old:
            return "오래된순"
        }
    }
}
