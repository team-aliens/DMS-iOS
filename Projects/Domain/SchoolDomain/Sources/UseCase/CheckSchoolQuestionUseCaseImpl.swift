import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct CheckSchoolQuestionUseCaseImpl: CheckSchoolQuestionUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func execute(schoolID: String, answer: String) -> AnyPublisher<Void, Error> {
        schoolRepository.checkSchoolQuestion(schoolID: schoolID, answer: answer)
    }
}
