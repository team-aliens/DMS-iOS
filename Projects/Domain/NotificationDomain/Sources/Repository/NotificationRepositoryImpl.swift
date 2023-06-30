import Combine
import NotificationDomainInterface

public struct NotificationRepositoryImpl: NotificationRepository {
    private let remoteNotificationDataSource: any RemoteNotificationDataSource

    public init(remoteNotificationDataSource: any RemoteNotificationDataSource) {
        self.remoteNotificationDataSource = remoteNotificationDataSource
    }

    public func postDeviceToken(token: String) -> AnyPublisher<Void, Error> {
        remoteNotificationDataSource.postDeviceToken(token: token)
    }

    public func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        <#code#>
    }
}
