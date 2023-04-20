import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct VerifyAuthCodeUseCaseImpl: VerifyAuthCodeUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, DmsError> {
        authRepository.verifyAuthCode(req: req)
    }
}
