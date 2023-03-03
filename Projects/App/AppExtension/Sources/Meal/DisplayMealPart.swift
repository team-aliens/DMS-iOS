import DesignSystem
import Foundation
import Utility

enum DisplayMealPart {
    case breakfast
    case lunch
    case dinner

    init(date: Date) {
        switch date.hour {
        case 0..<8:
            self = .breakfast

        case 8..<13:
            self = .lunch

        case 13..<24:
            self = .dinner

        default:
            self = .breakfast
        }
    }

    var systemName: String {
        switch self {
        case .breakfast:
            return "sun.haze"

        case .lunch:
            return "sun.max"

        case .dinner:
            return "moon"
        }
    }

    var display: String {
        switch self {
        case .breakfast:
            return "아침"

        case .lunch:
            return "점심"

        case .dinner:
            return "저녁"
        }
    }
}
