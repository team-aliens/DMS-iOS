import Combine
import NotificationDomainInterface

public struct SubscribeTopicUseCaseImpl: SubscribeTopicUseCase {
    private let notificationRepository: any NotificationRepository

    public init(notificationRepository: any NotificationRepository) {
        self.notificationRepository = notificationRepository
    }

    public func execute(token: String, topic: TopicType) -> AnyPublisher<Void, Error> {
        notificationRepository.subscribeTopic(token: token, topic: topic)
    }
}
