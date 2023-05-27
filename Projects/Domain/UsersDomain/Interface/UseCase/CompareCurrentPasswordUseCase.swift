import Combine

public protocol CompareCurrentPasswordUseCase {
    func execute(password: String) -> AnyPublisher<Void, Error>
}
