import Combine
import DomainModule
import DataMappingModule
import ErrorModule
import Foundation

public struct RemotePresignedDataSourceStub: RemotePresignedDataSource {
    public init() {}

    public func presignedUploadFile(uploadURL: String, data: Data) -> AnyPublisher<Void, DmsError> {
        Just(())
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
