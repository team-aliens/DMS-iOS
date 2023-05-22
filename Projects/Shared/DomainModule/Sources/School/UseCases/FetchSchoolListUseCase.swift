import Combine
import DataMappingModule
import ErrorModule

public protocol FetchSchoolListUseCase {
    func execute() -> AnyPublisher<[SchoolEntity], DmsError>
}
