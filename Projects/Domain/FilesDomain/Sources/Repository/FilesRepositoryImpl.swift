import Combine
import Foundation
import FilesDomainInterface

public struct FilesRepositoryImpl: FilesRepository {
    private let remoteFilesDataSource: any RemoteFilesDataSource

    public init(remoteFilesDataSource: any RemoteFilesDataSource) {
        self.remoteFilesDataSource = remoteFilesDataSource
    }

    public func uploadFile(data: String) -> AnyPublisher<String, Error> {
        remoteFilesDataSource.uploadFile(data: data)
    }
}
