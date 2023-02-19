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

    public func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, ErrorModule.DmsError> {
        remoteRemainsDataSource.remainingApplicationsChanges(id: id)
    }

    public func fetchMyRemainApplicationItems() ->
    AnyPublisher<DomainModule.MyRemainApplicationItemsEntity, ErrorModule.DmsError> {
        remoteRemainsDataSource.fetchMyRemainApplicationItems()
    }

    public func fetchRemainsAvailableTime() ->
    AnyPublisher<DomainModule.RemainsAvailableTimeEntity, ErrorModule.DmsError> {
        remoteRemainsDataSource.fetchRemainsAvailableTime()
    }

    public func fetchListRemainApplicationItems() ->
    AnyPublisher<DomainModule.ListRemainApplicationItemsEntity, ErrorModule.DmsError> {
        remoteRemainsDataSource.fetchListRemainApplicationItems()
    }
}
