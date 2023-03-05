import Foundation

public enum WeekType: String, Decodable {
    case monday = "MONDAY"
    case tuesday = "TUESDAY"
    case wednesday = "WEDNESDAY"
    case thursday = "THURSDAY"
    case friday = "FRIDAY"
    case satuday = "SATURDAY"
    case sunday = "SUNDAY"

    public func displayString() -> String {
        switch self {
        case .monday:
            return "월"

        case .tuesday:
            return "화"

        case .wednesday:
            return "수"

        case .thursday:
            return "목"

        case .friday:
            return "금"

        case .satuday:
            return "토"

        case .sunday:
            return "일"
        }
    }
}
