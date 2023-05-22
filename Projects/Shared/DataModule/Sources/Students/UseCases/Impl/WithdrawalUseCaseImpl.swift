import Combine
import DomainModule
import ErrorModule

public struct WithdrawalUseCaseImpl: WithdrawalUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute() -> AnyPublisher<Void, DmsError> {
        studentsRepository.withdrawal()
    }
}
