import NeedleFoundation
import NetworkModule
import DomainModule
import DataModule

extension WidgetComponent {
    var remotePointsDataSource: any RemotePointsDataSource {
        shared {
            RemotePointsDataSourceImpl(keychain: keychain)
        }
    }

    var pointsRepository: any PointsRepository {
        shared {
            PointsRepositoryImpl(remotePointsDataSource: remotePointsDataSource)
        }
    }

    var fetchPointListUseCase: any FetchPointListUseCase {
        shared {
            FetchPointListUseCaseImpl(pointsRepository: pointsRepository)
        }
    }
}
