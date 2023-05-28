import Combine

public protocol RemotePointsDataSource {
    func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, Error>
}
