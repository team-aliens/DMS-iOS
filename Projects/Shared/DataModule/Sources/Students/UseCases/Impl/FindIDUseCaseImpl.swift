import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FindIDUseCaseImpl: FindIDUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: FindIDRequestDTO) -> AnyPublisher<String, DmsError> {
        studentsRepository.findID(req: req)
    }
}
