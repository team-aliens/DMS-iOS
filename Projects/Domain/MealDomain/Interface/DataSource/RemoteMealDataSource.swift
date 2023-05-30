import Combine
import Foundation

public protocol RemoteMealDataSource {
    func fetchMealList(date: String) -> AnyPublisher<[MealEntity], Error>
}
