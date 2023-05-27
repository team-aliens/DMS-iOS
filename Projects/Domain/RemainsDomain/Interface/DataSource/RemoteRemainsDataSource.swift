import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public protocol RemoteRemainsDataSource {
    func remainingApplicationsChanges(id: String) -> AnyPublisher<Void, Error>
    func fetchMyRemainApplicationItems() -> AnyPublisher<MyRemainApplicationItemsEntity, Error>
    func fetchRemainsAvailableTime() -> AnyPublisher<RemainsAvailableTimeEntity, Error>
    func fetchRemainApplicationList() -> AnyPublisher<RemainApplicationListEntity, Error>
}
