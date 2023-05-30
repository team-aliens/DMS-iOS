import Combine

public protocol RemoteMealDataSource {
    func fetchMealList(date: String) -> AnyPublisher<[MealEntity], Error>
}
