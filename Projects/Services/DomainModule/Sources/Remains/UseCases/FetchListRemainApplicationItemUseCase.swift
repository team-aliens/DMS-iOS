import Combine
import DataMappingModule
import ErrorModule

public protocol FetchListRemainApplicationItemUseCase {
    func execute() -> AnyPublisher<ListRemainApplicationItemEntity, DmsError>
}
