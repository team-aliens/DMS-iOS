import Foundation

struct FetchMealListResponseDTO: Decodable {
    let meals: [SingleMealResponseDTO]

    struct SingleMealResponseDTO: Decodable {
        let date: Date
        let breakfast: [String]
        let lunch: [String]
        let dinner: [String]
    }
}

extension FetchMealListResponseDTO.SingleMealResponseDTO {
    func toDomain() -> MealEntity {
        MealEntity(
            date: date,
            breakfast: breakfast,
            lunch: lunch,
            dinner: dinner
        )
    }
}

extension FetchMealListResponseDTO {
    func toDomain() -> [MealEntity] {
        meals.map { $0.toDomain() }
    }
}
