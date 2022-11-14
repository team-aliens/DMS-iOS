import Combine
import APIKit
import DomainModule
import ErrorModule

public protocol RemotePointsDataSource {
    func fetchPointsList(type: PointsType) -> AnyPublisher<[PointEntity], DmsError>
}
