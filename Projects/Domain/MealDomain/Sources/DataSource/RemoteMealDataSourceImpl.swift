import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteMealDataSourceImpl: BaseRemoteDataSource<MealAPI>, RemoteMealDataSource {
    public func fetchMealList(date: String) -> AnyPublisher<[MealEntity], Error> {
        request(.fetchMealList(date), dto: FetchMealListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
