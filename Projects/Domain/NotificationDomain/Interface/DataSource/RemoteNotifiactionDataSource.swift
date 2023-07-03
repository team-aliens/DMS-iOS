import Combine

public protocol RemoteNotificationDataSource {
    func postDeviceToken(token: String) -> AnyPublisher<Void, Error>
    func subscribeTopic(token: String, topic: TopicType) -> AnyPublisher<Void, Error>
}
