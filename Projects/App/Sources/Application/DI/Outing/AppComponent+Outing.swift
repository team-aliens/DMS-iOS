import NeedleFoundation
import OutingDomain
import OutingDomainInterface

public extension AppComponent {
    var remoteOutingDataSource: any RemoteOutingDataSource {
        shared {
            RemoteOutingDataSourceImpl(keychain: keychain)
        }
    }

    var outingRepository: any OutingRepository {
        shared {
            OutingRepositoryImpl(remoteOutingDataSource: remoteOutingDataSource)
        }
    }

    var fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase {
        shared {
            FetchMyOutingApplicationItemUseCaseImpl(outingRepository: outingRepository)
        }
    }
}
