import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct GetSchoolListUseCaseImpl: GetSchoolListUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func execute() -> AnyPublisher<[SchoolEntity], DmsError> {
        schoolRepository.getSchoolList()
    }

}
