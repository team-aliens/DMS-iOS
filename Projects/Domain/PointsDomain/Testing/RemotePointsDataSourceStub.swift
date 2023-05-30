import Combine
import Foundation
import PointsDomainInterface

public struct RemotePointsDataSourceStub: RemotePointsDataSource {
    public init() {}

    public func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, Error> {
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
        ).setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
