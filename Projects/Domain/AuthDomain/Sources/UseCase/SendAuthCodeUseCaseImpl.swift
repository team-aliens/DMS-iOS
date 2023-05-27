import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct SendAuthCodeUseCaseImpl: SendAuthCodeUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error> {
        authRepository.sendAuthCode(req: req)
    }
}
