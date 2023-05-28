import Combine

public protocol UploadFileUseCase {
    func execute(data: String) -> AnyPublisher<String, Error>
}
