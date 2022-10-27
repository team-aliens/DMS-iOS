import DomainModule
import DataModule
import NetworkModule

public extension AppComponent {
    var remoteFilesDataSource: any RemoteFilesDataSource {
        RemoteFilesDataSourceImpl(keychain: keychain)
    }
    var filesRepository: any FilesRepository {
        FilesRepositoryImpl(remoteFilesDataSource: remoteFilesDataSource)
    }
    var uploadFileUseCase: any UploadFileUseCase {
        UploadFileUseCaseImpl(filesRepository: filesRepository)
    }
}
