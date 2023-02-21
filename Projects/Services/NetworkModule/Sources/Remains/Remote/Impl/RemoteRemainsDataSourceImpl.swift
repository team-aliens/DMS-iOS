import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteRemainsDataSourceImpl: BaseRemoteDataSource<RemainsAPI>,
                                                RemoteRemainsDataSource {
    public func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, DmsError> {
        request(.remainingApplicationsChanges(id: id))
    }
    
    public func fetchMyRemainApplicationItems() -> AnyPublisher<MyRemainApplicationItemsEntity, DmsError> {
        request(.fetchMyRemainApplicationItems, dto: FetchMyRemainApplicationItemsResponseDTO.self)
        .map { $0.toDomain() }
        .eraseToAnyPublisher()
    }
    
    public func fetchRemainsAvailableTime() -> AnyPublisher<RemainsAvailableTimeEntity, DmsError> {
        request(.fetchRemainsAvailableTime, dto: FetchRemainsAvailableTimeResponseDTO.self)
        .map { $0.toDomain() }
        .eraseToAnyPublisher()
    }
    public func fetchRemainApplicationList() -> AnyPublisher<RemainApplicationListEntity, DmsError> {
        request(.fetchRemainApplicationList, dto: FetchRemainAppListResponseDTO.self)
        .map { $0.toDomain() }
        .eraseToAnyPublisher()
    }
}
