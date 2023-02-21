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
            RemainingApplicationsChangesUseCaselmpl(remainsRepository: remainsRepository)
        }
    }

    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase {
        shared {
            FetchMyRemainApplicationItemsUseCaselmpl(remainsRepository: remainsRepository)
        }
    }

    var fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase {
        shared {
            FetchRemainAppListUseCaselmpl(remainsRepository: remainsRepository)
        }
    }

    var fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase {
        shared {
            FetchRemainsAvailableTimeUseCaselmpl(remainsRepository: remainsRepository)
        }
    }
}
