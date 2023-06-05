import Combine

public protocol CheckDuplicateEmailUseCase {
    func execute(email: String) -> AnyPublisher<Void, Error>
}
