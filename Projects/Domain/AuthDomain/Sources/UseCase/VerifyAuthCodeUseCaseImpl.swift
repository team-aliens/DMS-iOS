import Combine
import AuthDomainInterface

public struct VerifyAuthCodeUseCaseImpl: VerifyAuthCodeUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        authRepository.verifyAuthCode(req: req)
    }
}
