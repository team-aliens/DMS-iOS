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

    public func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, Error> {
        remoteRemainsDataSource.remainingApplicationsChanges(id: id)
    }

    public func fetchMyRemainApplicationItems() ->
    AnyPublisher<MyRemainApplicationItemsEntity, Error> {
        remoteRemainsDataSource.fetchMyRemainApplicationItems()
    }

    public func fetchRemainsAvailableTime() ->
    AnyPublisher<RemainsAvailableTimeEntity, Error> {
        remoteRemainsDataSource.fetchRemainsAvailableTime()
    }

    public func fetchRemainApplicationList() ->
    AnyPublisher<RemainApplicationListEntity, Error> {
        remoteRemainsDataSource.fetchRemainApplicationList()
    }
}
