import Combine

public protocol SubscribeTopicUseCase {
    func execute(token: String, topic: TopicType) -> AnyPublisher<Void, Error>
}
