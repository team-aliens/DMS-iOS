import BaseFeature
import NotificationDomainInterface
import Combine

final class SetNotificationViewModel: BaseViewModel {
    private let subscribeTopicUseCase: any SubscribeTopicUseCase

    public init(
        subscribeTopicUseCase: any SubscribeTopicUseCase
    ) {
        self.subscribeTopicUseCase = subscribeTopicUseCase
    }
}
