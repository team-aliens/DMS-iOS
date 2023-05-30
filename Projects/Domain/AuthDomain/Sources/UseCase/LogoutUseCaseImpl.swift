import AuthDomainInterface

public struct LogoutUseCaseImpl: LogoutUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() {
        authRepository.logout()
    }
}
