import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

public extension AppComponent {
    var remoteRemainsDataSource: any RemoteRemainsDataSource {
        RemoteRemainsDataSourceImpl(keychain: keychain)
    }

    var remainsRepository: any RemainsRepository {
        RemainsRepositoryImpl(remoteRemainsDataSource: remoteRemainsDataSource)
    }

    var remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase {
        RemainingApplicationsChangesUseCaselmpl(remainsRepository: remainsRepository)
    }

    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase {
        FetchMyRemainApplicationItemsUseCaselmpl(remainsRepository: remainsRepository)
    }

    var fetchListRemainApplicationItemsUseCase: any FetchListRemainApplicationItemsUseCase {
        FetchListRemainAppItemsUseCaselmpl(remainsRepository: remainsRepository)
    }

    var fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase {
        FetchRemainsAvailableTimeUseCaselmpl(remainsRepository: remainsRepository)
    }
}
