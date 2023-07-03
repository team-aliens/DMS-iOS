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

    var postDeviceTokenUseCase: any PostDeviceTokenUseCase {
        shared {
            PostDeviceTokenUseCaseImpl(notificationRepository: notificationRepository)
        }
    }

    var subscribeTopicUseCase: any SubscribeTopicUseCase {
        shared {
            SubscribeTopicUseCaseImpl(notificationRepository: notificationRepository)
        }
    }
}
