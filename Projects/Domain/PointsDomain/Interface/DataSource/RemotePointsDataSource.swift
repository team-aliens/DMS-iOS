import Combine
import APIKit
import DomainModule
import ErrorModule
import DataMappingModule

public protocol RemotePointsDataSource {
    func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, Error>
}
