import Combine
import ErrorModule

public protocol FetchPointsListUseCase {
    func execute(date: String) -> AnyPublisher<[PointsList], DmsError>
}
