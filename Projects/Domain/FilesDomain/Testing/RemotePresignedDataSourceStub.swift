import FilesDomainInterface
import Foundation
import Combine

public struct RemotePresignedDataSourceStub: RemotePresignedDataSource {
    public init() {}

    public func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, Error> {
        Just(())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
