import Combine

public protocol ChangeProfileImageUseCase {
    func execute(url: String) -> AnyPublisher<Void, Error>
}
