import Combine
import Foundation
import FilesDomainInterface

public struct PresignedRepositoryImpl: PresignedRepository {
    private let remotePresignedDataSource: any RemotePresignedDataSource

    public init(remotePresignedDataSource: any RemotePresignedDataSource) {
        self.remotePresignedDataSource = remotePresignedDataSource
    }

    public func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, Error> {
        remotePresignedDataSource.presignedUploadFile(uploadURL: uploadURL, data: data)
    }
}
