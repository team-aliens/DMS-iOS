import Foundation

public enum DisplayMealPart: Int {
    case breakfast = 0
    case lunch
    case dinner
    case nextDayBreakfast

    public init(date: Date) {
        switch Calendar.current.component(.hour, from: date) {
        case 0..<9:
            self = .breakfast

        case 8..<14:
            self = .lunch

        case 14..<19:
            self = .dinner

        default:
            self = .nextDayBreakfast
        }
    }

    public var systemName: String {
        switch self {
        case .breakfast, .nextDayBreakfast:
            return "sun.haze"

        case .lunch:
            return "sun.max"

        case .dinner:
            return "moon"
        }
    }

    public var display: String {
        switch self {
        case .breakfast, .nextDayBreakfast:
            return "아침"

        case .lunch:
            return "점심"

        case .dinner:
            return "저녁"
        }
    }
}
