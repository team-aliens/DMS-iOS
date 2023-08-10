import Combine
import StudentsDomainInterface

public struct CheckExistGradeClassNumberUseCaseImpl: CheckExistGradeClassNumberUseCase {
    private let studentsRepository: any StudentsRepository

    public init(studentsRepository: any StudentsRepository) {
        self.studentsRepository = studentsRepository
    }

    public func execute(req: CheckExistGradeClassNumberRequestDTO) -> AnyPublisher<String, Error> {
        studentsRepository.checkExistGradeClassNumber(req: req)
    }
}
