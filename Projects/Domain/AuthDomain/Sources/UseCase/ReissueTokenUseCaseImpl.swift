import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct ReissueTokenCaseImpl: ReissueTokenUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() -> AnyPublisher<DmsFeatures, Error> {
        authRepository.reissueToken()
    }
}
