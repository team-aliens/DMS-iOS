import Combine
import DomainModule
import ErrorModule

public protocol RemotePointsDataSource {
    func fetchPointsList(type: String) -> AnyPublisher<[PointsEntity], DmsError>
}
