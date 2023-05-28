import Combine

public protocol RemainsRepository {
    func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, Error>
    func fetchMyRemainApplicationItems() -> AnyPublisher<MyRemainApplicationItemsEntity, Error>
    func fetchRemainsAvailableTime() -> AnyPublisher<RemainsAvailableTimeEntity, Error>
    func fetchRemainApplicationList() -> AnyPublisher<RemainApplicationListEntity, Error>
}
