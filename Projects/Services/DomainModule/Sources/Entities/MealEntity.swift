import Foundation

public struct MealEntity: Equatable {
    public init(
        date: String,
        breakfast: [String],
        lunch: [String],
        dinner: [String]
    ) {
        self.date = date
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
    }

    public let date: String
    public let breakfast: [String]
    public let lunch: [String]
    public let dinner: [String]
}
