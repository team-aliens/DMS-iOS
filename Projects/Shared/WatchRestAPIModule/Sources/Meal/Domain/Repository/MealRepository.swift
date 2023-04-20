import Foundation

public protocol MealRepository {
    func fetchMealList(date: Date) async throws -> [MealEntity]
}
