import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct SignupUseCaseImpl: SignupUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: SignupRequestDTO) -> AnyPublisher<DmsFeatures, Error> {
        studentsRepository.signup(req: req)
    }
}
