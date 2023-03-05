import Combine
import ErrorModule
import DataMappingModule

public protocol PointsRepository {
    func fetchPointList(type: PointsType) -> AnyPublisher<PointEntity, DmsError>
}
