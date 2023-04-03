import Combine
import DomainModule
import DataMappingModule
import ErrorModule
import Foundation

public struct RemoteFilesDataSourceStub: RemoteFilesDataSource {
    public init() {}

    public func uploadFile(data: Data) -> AnyPublisher<String, DmsError> {
        Just("https://avatars.githubusercontent.com/u/74440939?v=4")
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }

    public func fetchPresignedURL() -> AnyPublisher<PresignedURLEntity, DmsError> {
        Just(PresignedURLEntity(
            fileUploadURL: "https://admin.aliens-dms.com",
            fileURL: "https://admin.aliens-dms.com"
        ))
            .setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
