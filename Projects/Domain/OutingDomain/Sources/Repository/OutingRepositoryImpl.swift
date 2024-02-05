import Combine
import OutingDomainInterface

public struct OutingRepositoryImpl: OutingRepository {
    private let remoteOutingDataSource: any RemoteOutingDataSource

    public init(remoteOutingDataSource: any RemoteOutingDataSource) {
        self.remoteOutingDataSource = remoteOutingDataSource
    }

    public func fetchMyOutingApplicationItem() -> AnyPublisher<Void, Error> {
        remoteOutingDataSource.fetchMyOutingApplicationItem()
    }
}
