import Combine
import PointsDomainInterface

public struct PointsRepositoryImpl: PointsRepository {
    private let remotePointsDataSource: any RemotePointsDataSource

    public init(remotePointsDataSource: any RemotePointsDataSource) {
        self.remotePointsDataSource = remotePointsDataSource
    }

    public func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, Error> {
        remotePointsDataSource.fetchPointList(type: type)
    }
}
