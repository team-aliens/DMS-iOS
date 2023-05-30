import MealDomainInterface
import Foundation
import BaseDomain
import Combine

public final class RemoteMealDataSourceImpl: BaseRemoteDataSource<MealAPI>, RemoteMealDataSource {
    public func fetchMealList(date: String) -> AnyPublisher<[MealEntity], Error> {
        request(.fetchMealList(date), dto: FetchMealListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
