import FilesDomainInterface
import Foundation
import Combine

public struct RemoteFilesDataSourceStub: RemoteFilesDataSource {
    public init() {}

    public func uploadFile(data: Data) -> AnyPublisher<String, Error> {
        Just("https://avatars.githubusercontent.com/u/74440939?v=4")
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
