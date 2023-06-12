import Foundation

public struct FetchMealListResponseDTO: Decodable {
    public init(meals: [SingleMealResponseDTO]) {
        self.meals = meals
    }

    public let meals: [SingleMealResponseDTO]
}
