import Combine

public protocol RemoteNotificationDataSource {
    func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error>
}
