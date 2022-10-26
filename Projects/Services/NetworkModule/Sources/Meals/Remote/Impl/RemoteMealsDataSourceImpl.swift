import APIKit
import Combine
import DataMappingModule
import DomainModule

public final class RemoteMealsDataSourceImpl: BaseRemoteDataSource<MealsAPI>, RemoteMealsDataSource {
    public func fetchMealList(date: String) -> AnyPublisher<[MealEntity], DmsError> {
        request(.fetchMealList(date), dto: FetchMealListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
