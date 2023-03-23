import Combine
import DataMappingModule
import ErrorModule

public protocol FetchDetailStudyRoomUseCase {
    func execute(roomID: String, timeSlot: String) -> AnyPublisher<DetailStudyRoomEntity, DmsError>
}
