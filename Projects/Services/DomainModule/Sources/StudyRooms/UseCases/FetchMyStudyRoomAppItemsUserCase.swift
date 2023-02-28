import Combine
import DataMappingModule
import ErrorModule

public protocol FetchMyStudyRoomAppItemsUserCase {
    func execute() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError>
}
