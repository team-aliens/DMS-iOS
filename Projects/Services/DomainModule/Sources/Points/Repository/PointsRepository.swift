import Combine
import ErrorModule

public protocol PointsRepository {
    func fetchPointsList(date: String) -> AnyPublisher<[PointsEntity], DmsError>
}
