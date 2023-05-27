import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchSchoolListUseCaseImpl: FetchSchoolListUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func execute() -> AnyPublisher<[SchoolEntity], Error> {
        schoolRepository.fetchSchoolList()
    }

}
