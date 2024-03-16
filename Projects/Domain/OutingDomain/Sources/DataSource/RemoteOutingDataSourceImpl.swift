import Combine
import BaseDomain
import OutingDomainInterface

public final class RemoteOutingDataSourceImpl: BaseRemoteDataSource<OutingAPI>, RemoteOutingDataSource {
    public func fetchMyOutingApplicationItem() -> AnyPublisher<Void, Error> {
        request(.fetchMyOutingApplicationItem)
    }
}
