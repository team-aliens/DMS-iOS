import Combine
import Foundation

public protocol FetchMealListUseCase {
    func execute(date: String) -> AnyPublisher<[MealEntity], Error>
}
