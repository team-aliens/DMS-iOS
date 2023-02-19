import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public protocol RemoteRemainsDataSource {
    func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, DmsError>
    func fetchMyRemainApplicationItems() -> AnyPublisher<MyRemainApplicationItemsEntity, DmsError>
    func fetchRemainsAvailableTime() -> AnyPublisher<RemainsAvailableTimeEntity, DmsError>
    func fetchListRemainApplicationItems() -> AnyPublisher<ListRemainApplicationItemsEntity,
                                                            DmsError>
}
