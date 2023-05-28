import Combine

public protocol CheckAccountIDIsExistUseCase {
    func execute(id: String) -> AnyPublisher<String, Error>
}
