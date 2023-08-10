import Combine

public protocol PointsRepository {
    func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, Error>
}
