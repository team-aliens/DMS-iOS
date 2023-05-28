import Combine

public protocol CheckDuplicateAccountIDUseCase {
    func execute(id: String) -> AnyPublisher<Void, Error>
}
