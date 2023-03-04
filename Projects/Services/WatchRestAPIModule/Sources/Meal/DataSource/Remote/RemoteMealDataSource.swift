import Foundation

public protocol RemoteMealDataSource {
    func fetchMealList(date: Date) async throws -> [MealEntity]
}
