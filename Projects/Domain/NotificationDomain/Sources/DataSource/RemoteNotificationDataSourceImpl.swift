import NotificationDomainInterface
import BaseDomain
import Combine

public final class RemoteNotificationDataSourceImpl:
    BaseRemoteDataSource<NotificationAPI>, RemoteNotificationDataSource {
    public func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        request(.subscribeTopic(token: token, topic: topic))
    }
}
