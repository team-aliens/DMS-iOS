import Combine

public protocol FetchPointListUseCase {
    func execute(type: PointsType) -> AnyPublisher<PointEntity, Error>
}
