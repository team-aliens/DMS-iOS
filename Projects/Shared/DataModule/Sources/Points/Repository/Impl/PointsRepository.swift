import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct PointsRepositoryImpl: PointsRepository {
    private let remotePointsDataSource: any RemotePointsDataSource

    public init(remotePointsDataSource: any RemotePointsDataSource) {
        self.remotePointsDataSource = remotePointsDataSource
    }

    public func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, DmsError> {
        remotePointsDataSource.fetchPointList(type: type)
    }
}
