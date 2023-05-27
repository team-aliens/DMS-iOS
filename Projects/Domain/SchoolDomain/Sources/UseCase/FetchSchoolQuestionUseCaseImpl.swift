import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchSchoolQuestionUseCaseImpl: FetchSchoolQuestionUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func execute(schoolID: String) -> AnyPublisher<String, Error> {
        schoolRepository.fetchSchoolQuestion(schoolID: schoolID)
    }

}
