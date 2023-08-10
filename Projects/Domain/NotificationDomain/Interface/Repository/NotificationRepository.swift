import Combine

public protocol NotificationRepository {
    func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error>
}
