import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation
import Utility
import APIKit

public struct RemotePointsDataSourceStub: RemotePointsDataSource {
    public init() {}

    public func fetchPointsList(type: PointsType) -> AnyPublisher<[PointEntity], DmsError> {
        Just([
        ]).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
