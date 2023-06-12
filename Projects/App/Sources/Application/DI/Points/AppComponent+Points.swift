import NeedleFoundation
import PointsDomain
import PointsDomainInterface

public extension AppComponent {
    var remotePointsDataSource: any RemotePointsDataSource {
        shared {
//            RemotePointsDataSourceStub()
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
