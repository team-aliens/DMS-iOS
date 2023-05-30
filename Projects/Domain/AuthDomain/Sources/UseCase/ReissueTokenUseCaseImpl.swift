import Combine
import AuthDomainInterface

public struct ReissueTokenCaseImpl: ReissueTokenUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() -> AnyPublisher<SigninDmsFeatures, Error> {
        authRepository.reissueToken()
    }
}
