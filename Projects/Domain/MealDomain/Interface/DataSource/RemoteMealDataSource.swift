import Combine
import DomainModule
import ErrorModule

public protocol RemoteMealDataSource {
    func fetchMealList(date: String) -> AnyPublisher<[MealEntity], Error>
}
