import Combine

public protocol FilesRepository {
    func uploadFile(data: String) -> AnyPublisher<String, Error>
}
