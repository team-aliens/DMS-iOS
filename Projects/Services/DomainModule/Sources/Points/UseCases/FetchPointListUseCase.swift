import Combine
import ErrorModule
import DataMappingModule

public protocol FetchPointListUseCase {
    func execute(type: PointsType) -> AnyPublisher<PointEntity, DmsError>
}
