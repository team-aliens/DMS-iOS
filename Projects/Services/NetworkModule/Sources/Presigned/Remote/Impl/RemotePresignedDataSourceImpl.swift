import APIKit
import DomainModule
import Combine
import DataMappingModule
import ErrorModule
import Foundation

public final class RemotePresignedDataSourceImpl: BaseRemoteDataSource<PresignedAPI>, RemotePresignedDataSource {
    public func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, DmsError> {
        request(.presignedUploadFile(uploadURL: uploadURL, data: data))
            .eraseToAnyPublisher()
    }
}
