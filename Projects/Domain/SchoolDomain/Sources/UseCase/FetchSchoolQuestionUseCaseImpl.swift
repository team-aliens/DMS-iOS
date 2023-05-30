import Combine
import SchoolDomainInterface

public struct FetchSchoolQuestionUseCaseImpl: FetchSchoolQuestionUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func execute(schoolID: String) -> AnyPublisher<String, Error> {
        schoolRepository.fetchSchoolQuestion(schoolID: schoolID)
    }

}
