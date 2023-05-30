import Combine
import SchoolDomainInterface

public struct FetchSchoolListUseCaseImpl: FetchSchoolListUseCase {
    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func execute() -> AnyPublisher<[SchoolEntity], Error> {
        schoolRepository.fetchSchoolList()
    }

}
