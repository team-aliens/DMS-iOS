import Combine

public protocol ChangePasswordUseCase {
    func execute(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error>
}
