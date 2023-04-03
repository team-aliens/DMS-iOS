import DomainModule
import DataModule
import NetworkModule

public extension AppComponent {
    var remotePresignedDataSource: any RemotePresignedDataSource {
        shared {
            RemotePresignedDataSourceImpl(keychain: keychain)
        }
    }

    var presignedRepository: any PresignedRepository {
        shared {
            PresignedRepositoryImpl(remotePresignedDataSource: remotePresignedDataSource)
        }
    }

    var presignedUploadFileUseCase: any PresignedUploadFileUseCase {
        shared {
            PresignedUploadFileUseCaseImpl(presignedRepository: presignedRepository)
        }
    }
}
