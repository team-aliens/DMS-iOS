import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemotePointsDataSourceImpl: BaseRemoteDataSource<PointsAPI>, RemotePointsDataSource {
    public func fetchPointsList(type: String) -> AnyPublisher<[PointEntity], DmsError> {
        request(.fetchPointsList(type), dto: FetchPointsListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
