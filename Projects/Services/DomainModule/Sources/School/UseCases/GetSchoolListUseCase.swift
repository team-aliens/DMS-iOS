import Combine
import DataMappingModule
import ErrorModule

public protocol GetSchoolListUseCase {
    func execute() -> AnyPublisher<[SchoolEntity], DmsError>
}
