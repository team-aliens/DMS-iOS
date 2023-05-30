import Combine
import StudentsDomainInterface

public struct WithdrawalUseCaseImpl: WithdrawalUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute() -> AnyPublisher<Void, Error> {
        studentsRepository.withdrawal()
    }
}
