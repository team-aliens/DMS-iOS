import Combine

public protocol FetchMyStudyRoomAppItemsUseCase {
    func execute() -> AnyPublisher<MyStudyRoomAppItemsEntity, Error>
}
