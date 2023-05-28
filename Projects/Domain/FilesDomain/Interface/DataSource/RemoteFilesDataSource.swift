import Combine

public protocol RemoteFilesDataSource {
    func uploadFile(data: String) -> AnyPublisher<String, Error>
}
