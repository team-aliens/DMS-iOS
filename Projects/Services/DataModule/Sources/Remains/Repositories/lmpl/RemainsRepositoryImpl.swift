import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct RemainsRepositoryImpl: RemainsRepository {
    private let remoteRemainsDataSource: any RemoteRemainsDataSource

    public init(remoteRemainsDataSource: any RemoteRemainsDataSource) {
        self.remoteRemainsDataSource = remoteRemainsDataSource
    }

    public func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, DmsError> {
        remoteRemainsDataSource.remainingApplicationsChanges(id: id)
    }

    public func fetchMyRemainApplicationItems() ->
    AnyPublisher<MyRemainApplicationItemsEntity, DmsError> {
        remoteRemainsDataSource.fetchMyRemainApplicationItems()
    }

    public func fetchRemainsAvailableTime() ->
    AnyPublisher<RemainsAvailableTimeEntity, DmsError> {
        remoteRemainsDataSource.fetchRemainsAvailableTime()
    }

    public func fetchListRemainApplicationItem() ->
    AnyPublisher<ListRemainApplicationItemEntity, DmsError> {
        remoteRemainsDataSource.fetchListRemainApplicationItem()
    }
}
