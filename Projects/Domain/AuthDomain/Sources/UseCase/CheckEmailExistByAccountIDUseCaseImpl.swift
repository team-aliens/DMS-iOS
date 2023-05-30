import Combine
import AuthDomainInterface

public struct CheckEmailExistByAccountIDUseCaseImpl: CheckEmailExistByAccountIDUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: EmailExistByAccountIDRequestDTO) -> AnyPublisher<Void, Error> {
        authRepository.checkEmailExistByAccountID(req: req)
    }
}
