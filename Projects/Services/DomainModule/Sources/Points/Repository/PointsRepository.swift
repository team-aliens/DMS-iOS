import Combine
import ErrorModule

public protocol PointsRepository {
    func fetchPointsList(date: String) -> AnyPublisher<[PointEntity], DmsError>
}
