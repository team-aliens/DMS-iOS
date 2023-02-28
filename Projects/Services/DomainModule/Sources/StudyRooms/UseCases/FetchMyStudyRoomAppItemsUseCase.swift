import Combine
import DataMappingModule
import ErrorModule

public protocol FetchMyStudyRoomAppItemsUseCase {
    func execute() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError>
}
