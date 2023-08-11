import FilesDomainInterface
import Foundation
import BaseDomain
import Combine

public final class RemotePresignedDataSourceImpl: BaseRemoteDataSource<PresignedAPI>, RemotePresignedDataSource {
    public func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, Error> {
        request(.presignedUploadFile(uploadURL: uploadURL, data: data))
            .eraseToAnyPublisher()
    }
}
