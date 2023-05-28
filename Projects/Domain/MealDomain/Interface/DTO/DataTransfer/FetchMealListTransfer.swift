import Foundation

public extension SingleMealResponseDTO {
    func toDomain() -> MealEntity {
        MealEntity(
            date: date,
            breakfast: breakfast,
            lunch: lunch,
            dinner: dinner
        )
    }
}

public extension FetchMealListResponseDTO {
    func toDomain() -> [MealEntity] {
        meals.map { $0.toDomain() }
    }
}
