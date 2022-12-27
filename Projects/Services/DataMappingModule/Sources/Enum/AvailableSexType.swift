import Foundation

public enum AvailableSexType: String, Decodable {
    case all = "ALL"
    case male = "MALE"
    case female = "FEMALE"

    public func displayString() -> String {
        switch self {
        case .all:
            return "남녀"
        case .male:
            return "남자"
        case .female:
            return "여자"
        }
    }
}
