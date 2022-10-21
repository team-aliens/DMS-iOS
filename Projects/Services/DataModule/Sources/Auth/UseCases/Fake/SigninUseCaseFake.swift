import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public struct SigninUseCaseFake: SigninUseCase {
    public init () {}

    public func execute(req: SigninRequestDTO) -> AnyPublisher<Void, DmsError> {
        if req.accountID == "baekteun" && req.password == "baekteun" {
            return Just(()).setFailureType(to: DmsError.self)
                .delay(for: 1, scheduler: DispatchQueue.main)
                .eraseToAnyPublisher()
        } else {
            return Fail(error: DmsError.passwordMismatch)
                .delay(for: 1, scheduler: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
    }
}
