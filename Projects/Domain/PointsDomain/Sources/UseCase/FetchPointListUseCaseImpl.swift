import Combine
import PointsDomainInterface

public struct FetchPointListUseCaseImpl: FetchPointListUseCase {
    private let pointsRepository: any PointsRepository

    public init(pointsRepository: any PointsRepository) {
        self.pointsRepository = pointsRepository
    }

    public func execute(type: PointsType) -> AnyPublisher<PointEntity, Error> {
        pointsRepository.fetchPointList(type: type)
    }
}
