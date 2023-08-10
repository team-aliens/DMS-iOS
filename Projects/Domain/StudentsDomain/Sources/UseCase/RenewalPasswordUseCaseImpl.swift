import Combine
import StudentsDomainInterface

public struct RenewalPasswordUseCaseImpl: RenewalPasswordUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error> {
        studentsRepository.renewalPassword(req: req)
    }
}
