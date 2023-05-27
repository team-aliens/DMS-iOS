import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemotePointsDataSourceImpl: BaseRemoteDataSource<PointsAPI>, RemotePointsDataSource {
    public func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, Error> {
        request(.fetchPointsList(type: type), dto: FetchPointListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
