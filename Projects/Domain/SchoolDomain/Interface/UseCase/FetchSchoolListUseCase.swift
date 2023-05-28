import Combine

public protocol FetchSchoolListUseCase {
    func execute() -> AnyPublisher<[SchoolEntity], Error>
}
