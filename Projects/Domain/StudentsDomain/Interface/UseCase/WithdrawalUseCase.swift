import Combine
import ErrorModule

public protocol WithdrawalUseCase {
    func execute() -> AnyPublisher<Void, DmsError>
}
