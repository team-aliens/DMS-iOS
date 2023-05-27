import Combine
import DomainModule
import ErrorModule

public struct CompareCurrentPasswordUseCaseImpl: CompareCurrentPasswordUseCase {
    private let usersRepository: any UsersRepository

    public init(usersRepository: any UsersRepository) {
        self.usersRepository = usersRepository
    }

    public func execute(password: String) -> AnyPublisher<Void, Error> {
        usersRepository.compareCurrentPasssword(password: password)
    }
}
