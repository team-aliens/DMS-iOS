import Combine
import DomainModule
import Foundation
import NetworkModule
import ErrorModule

public struct PresignedRepositoryImpl: PresignedRepository {
    private let remotePresignedDataSource: any RemotePresignedDataSource

    public init(remotePresignedDataSource: any RemotePresignedDataSource) {
        self.remotePresignedDataSource = remotePresignedDataSource
    }

    public func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, DmsError> {
        remotePresignedDataSource.presignedUploadFile(uploadURL: uploadURL, data: data)
    }
}
