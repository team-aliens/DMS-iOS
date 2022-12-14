import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct CheckDuplicateEmailUseCaseImpl: CheckDuplicateEmailUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(email: String) -> AnyPublisher<Void, DmsError> {
        studentsRepository.checkDuplicateEmail(email: email)
    }
}
