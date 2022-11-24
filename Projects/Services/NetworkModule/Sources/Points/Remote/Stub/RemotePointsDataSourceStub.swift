import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation
import Utility
import APIKit

public struct RemotePointsDataSourceStub: RemotePointsDataSource {
    public init() {}

    public func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, DmsError> {
        Just(
            .init(
                totalPoint: 10,
                poinsts: [
                    .init(
                        pointID: UUID().uuidString,
                        date: .init(),
                        type: .bonus,
                        name: "타호실 출입",
                        score: 3
                    )
                ]
            )
        ).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
