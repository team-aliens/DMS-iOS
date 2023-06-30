import NotificationDomainInterface
import BaseDomain
import Combine

public final class RemoteNotificationDataSourceImpl:
    BaseRemoteDataSource<NotificationAPI>, RemoteNotificationDataSource {
    public func postDeviceToken(token: String) -> AnyPublisher<Void, Error> {
        request(.postDeviceToken(token: token))
    }

    public func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        request(.postDeviceToken(token: token))
    }
}
