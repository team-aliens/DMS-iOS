import Combine

public protocol FetchMealListUseCase {
    func execute(date: String) -> AnyPublisher<[MealEntity], Error>
}
