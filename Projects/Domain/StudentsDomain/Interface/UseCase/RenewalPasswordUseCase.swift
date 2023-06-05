import Combine

public protocol RenewalPasswordUseCase {
    func execute(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error>
}
