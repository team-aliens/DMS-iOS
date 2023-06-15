import Combine
import NotificationDomainInterface

public struct PostDeviceTokenUseCaseImpl: PostDeviceTokenUseCase {
    private let notificationRepository: any NotificationRepository

    public init(notificationRepository: any NotificationRepository) {
        self.notificationRepository = notificationRepository
    }

    public func execute(token: String) -> AnyPublisher<Void, Error> {
        notificationRepository.postDeviceToken(token: token)
    }
}
