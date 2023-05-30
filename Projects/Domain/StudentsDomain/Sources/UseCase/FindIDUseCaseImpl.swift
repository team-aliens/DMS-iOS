import Combine
import StudentsDomainInterface

public struct FindIDUseCaseImpl: FindIDUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: FindIDRequestDTO) -> AnyPublisher<String, Error> {
        studentsRepository.findID(req: req)
    }
}
