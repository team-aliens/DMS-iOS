import Combine
import AuthDomainInterface

public struct CheckAccountIDIsExistUseCaseImpl: CheckAccountIDIsExistUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(id: String) -> AnyPublisher<String, Error> {
        authRepository.checkAccountIDIsExist(id: id)
    }
}
