import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct CheckAccountIDIsExistUseCaseImpl: CheckAccountIDIsExistUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(id: String) -> AnyPublisher<String, DmsError> {
        authRepository.checkAccountIDIsExist(id: id)
    }
}
