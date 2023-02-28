import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteRemainsDataSource: any RemoteRemainsDataSource {
        shared {
            RemoteRemainsDataSourceImpl(keychain: keychain)
        }
    }

    var remainsRepository: any RemainsRepository {
        shared {
            RemainsRepositoryImpl(remoteRemainsDataSource: remoteRemainsDataSource)
        }
    }

    var remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase {
        shared {
            RemainingApplicationsChangesUseCaseImpl(remainsRepository: remainsRepository)
        }
    }

    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase {
        shared {
            FetchMyRemainApplicationItemsUseCaseImpl(remainsRepository: remainsRepository)
        }
    }

    var fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase {
        shared {
            FetchRemainAppListUseCaseImpl(remainsRepository: remainsRepository)
        }
    }

    var fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase {
        shared {
            FetchRemainsAvailableTimeUseCaseImpl(remainsRepository: remainsRepository)
        }
    }
}
