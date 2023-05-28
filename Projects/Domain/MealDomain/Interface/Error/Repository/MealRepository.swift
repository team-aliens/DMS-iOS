import Combine

public protocol MealRepository {
    func fetchMealList(date: String) -> AnyPublisher<[MealEntity], Error>
}
