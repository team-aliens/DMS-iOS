import Combine

public protocol RemoteFilesDataSource {
    func uploadFile(data: Data) -> AnyPublisher<String, Error>
}
