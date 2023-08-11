import BaseFeature
import NotificationDomainInterface
import Combine

final class SetNotificationViewModel: BaseViewModel {
    private let subscribeTopicUseCase: any SubscribeTopicUseCase
    @Published var isNoticeOn = false
    @Published var isTimeSlotOn = false
    @Published var isAvailableTimeOn = false

    public init(
        subscribeTopicUseCase: any SubscribeTopicUseCase
    ) {
        self.subscribeTopicUseCase = subscribeTopicUseCase
    }
}
