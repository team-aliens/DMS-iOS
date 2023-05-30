import Combine
import Foundation

public protocol MealRepository {
    func fetchMealList(date: String) -> AnyPublisher<[MealEntity], Error>
}
