import Combine
import StudentsDomainInterface

public struct CheckDuplicateEmailUseCaseImpl: CheckDuplicateEmailUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(email: String) -> AnyPublisher<Void, Error> {
        studentsRepository.checkDuplicateEmail(email: email)
    }
}
