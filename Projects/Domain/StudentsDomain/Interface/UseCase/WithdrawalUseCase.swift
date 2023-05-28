import Combine

public protocol WithdrawalUseCase {
    func execute() -> AnyPublisher<Void, Error>
}
