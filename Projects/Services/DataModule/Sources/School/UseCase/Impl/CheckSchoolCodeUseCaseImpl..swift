import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct CheckSchoolCodeUseCaseImpl: CheckSchoolCodeUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }
    public func execute(schoolID: String, code: String) -> AnyPublisher<String, DmsError> {
        schoolRepository.checkSchoolCode(schoolID: schoolID, code: code)
    }
}
