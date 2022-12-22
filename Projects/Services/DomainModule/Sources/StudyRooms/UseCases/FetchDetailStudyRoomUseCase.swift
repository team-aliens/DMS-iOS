import Combine
import DataMappingModule
import ErrorModule

public protocol FetchDetailStudyRoomUseCase {
    func execute(roomID: String) -> AnyPublisher<DetailStudyRoomEntity, DmsError>
}
