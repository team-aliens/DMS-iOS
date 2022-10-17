import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct CheckEmailExistByAccountIDUseCaseImpl: CheckEmailExistByAccountIDUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, DmsError> {
        authRepository.checkEmailExistByAccountID(req: req)
    }
}
