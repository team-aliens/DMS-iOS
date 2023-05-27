import Combine
import DomainModule
import ErrorModule
import NetworkModule

public struct MealRepositoryImpl: MealRepository {
    private let remoteMealDataSource: any RemoteMealDataSource

    public init(remoteMealDataSource: any RemoteMealDataSource) {
        self.remoteMealDataSource = remoteMealDataSource
    }

    public func fetchMealList(date: String) -> AnyPublisher<[MealEntity], Error> {
        remoteMealDataSource.fetchMealList(date: date)
    }
}
