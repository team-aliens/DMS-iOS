import Combine
import APIKit
import DomainModule
import ErrorModule
import DataMappingModule

public protocol RemotePointsDataSource {
    func fetchPointsList(type: PointsType) -> AnyPublisher<[PointEntity], DmsError>
}
