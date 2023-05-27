import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct RenewalPasswordUseCaseImpl: RenewalPasswordUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        studentsRepository.renewalPassword(req: req)
    }
}
