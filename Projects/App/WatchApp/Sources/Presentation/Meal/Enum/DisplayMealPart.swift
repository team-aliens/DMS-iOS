enum DisplayMealPart {
    case breakfast
    case lunch
    case dinner
}

extension DisplayMealPart {
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
}
