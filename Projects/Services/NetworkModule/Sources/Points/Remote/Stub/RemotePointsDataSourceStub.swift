import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation
import Utility

public struct RemotePointsDataSourceStub: RemotePointsDataSource {
    public init() {}

    public func fetchPointsList(type: String) -> AnyPublisher<[PointEntity], DmsError> {
        Just([
        ]).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
