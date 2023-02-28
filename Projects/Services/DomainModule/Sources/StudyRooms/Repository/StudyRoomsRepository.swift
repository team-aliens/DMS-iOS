import Combine
import DataMappingModule
import ErrorModule

public protocol StudyRoomsRepository {
    func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, DmsError>
    func fetchSeatTypes() -> AnyPublisher<[SeatTypeEntity], DmsError>
    func fetchStudyRoomList() -> AnyPublisher<[StudyRoomEntity], DmsError>
    func fetchDetailStudyRoom(roomID: String) -> AnyPublisher<DetailStudyRoomEntity, DmsError>
    func applyStudyRoomSeat(seatID: String) -> AnyPublisher<Void, DmsError>
    func cancelStudyRoomSeat() -> AnyPublisher<Void, DmsError>
    func fetchMyStudyRoomApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError>
}
