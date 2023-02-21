import Combine
import DataMappingModule
import ErrorModule

public protocol RemainsRepository {
    func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, DmsError>
    func fetchMyRemainApplicationItems() -> AnyPublisher<MyRemainApplicationItemsEntity, DmsError>
    func fetchRemainsAvailableTime() -> AnyPublisher<RemainsAvailableTimeEntity, DmsError>
    func fetchRemainApplicationList() -> AnyPublisher<RemainApplicationListEntity,
                                                            DmsError>
}
