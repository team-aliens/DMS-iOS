import NeedleFoundation
import NotificationDomain
import NotificationDomainInterface

public extension AppComponent {
    var remoteNotificationDataSource: any RemoteNotificationDataSource {
        shared {
            RemoteNotificationDataSourceImpl(keychain: keychain)
        }
    }

    var notificationRepository: any NotificationRepository {
        shared {
            NotificationRepositoryImpl(remoteNotificationDataSource: remoteNotificationDataSource)
        }
    }

    var subscribeTopicUseCase: any SubscribeTopicUseCase {
        shared {
            SubscribeTopicUseCaseImpl(notificationRepository: notificationRepository)
        }
    }
}
