import Foundation

struct FetchMealListResponseDTO: Decodable {
    let meals: [SingleMealResponseDTO]

    struct SingleMealResponseDTO: Decodable {
        let date: String
        let breakfast: [String]
        let lunch: [String]
        let dinner: [String]
    }
}

extension FetchMealListResponseDTO.SingleMealResponseDTO {
    func toDomain() -> MealEntity {
        MealEntity(
            date: date.toSmallDMSDate(),
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
