import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteRemainsDataSourceImpl: BaseRemoteDataSource<RemainsAPI>,
                                                RemoteRemainsDataSource {
    public func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, Error> {
        request(.remainingApplicationsChanges(id: id))
    }

    public func fetchMyRemainApplicationItems() -> AnyPublisher<MyRemainApplicationItemsEntity, Error> {
        request(.fetchMyRemainApplicationItems, dto: FetchMyRemainApplicationItemsResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchRemainsAvailableTime() -> AnyPublisher<RemainsAvailableTimeEntity, Error> {
        request(.fetchRemainsAvailableTime, dto: FetchRemainsAvailableTimeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchRemainApplicationList() -> AnyPublisher<RemainApplicationListEntity, Error> {
        request(.fetchRemainApplicationList, dto: FetchRemainAppListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
