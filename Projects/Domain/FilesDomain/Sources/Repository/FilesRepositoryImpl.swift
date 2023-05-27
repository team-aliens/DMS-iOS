import Combine
import DomainModule
import ErrorModule
import Foundation
import NetworkModule

public struct FilesRepositoryImpl: FilesRepository {
    private let remoteFilesDataSource: any RemoteFilesDataSource

    public init(remoteFilesDataSource: any RemoteFilesDataSource) {
        self.remoteFilesDataSource = remoteFilesDataSource
    }

    public func uploadFile(data: Data) -> AnyPublisher<String, Error> {
        remoteFilesDataSource.uploadFile(data: data)
    }
}
