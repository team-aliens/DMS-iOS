import Combine
import ErrorModule

public protocol MealRepository {
    func fetchMealList(date: String) -> AnyPublisher<[MealEntity], DmsError>
}
