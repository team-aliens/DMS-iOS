import Combine
import SchoolDomainInterface

public struct CheckSchoolCodeUseCaseImpl: CheckSchoolCodeUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }
    public func execute(code: String) -> AnyPublisher<String, Error> {
        schoolRepository.checkSchoolCode(code: code)
    }
}
