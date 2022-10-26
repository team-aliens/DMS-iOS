import Combine
import DomainModule
import ErrorModule

public protocol RemoteMealsDataSource {
    func fetchMealList(date: String) -> AnyPublisher<[MealEntity], DmsError>
}
