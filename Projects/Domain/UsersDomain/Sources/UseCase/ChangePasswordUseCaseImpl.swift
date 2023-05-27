import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct ChangePasswordUseCaseImpl: ChangePasswordUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        usersRepository.changePassword(req: req)
    }
}
