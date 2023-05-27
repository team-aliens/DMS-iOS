import Combine
import ErrorModule

public protocol FetchMealListUseCase {
    func execute(date: String) -> AnyPublisher<[MealEntity], Error>
}
