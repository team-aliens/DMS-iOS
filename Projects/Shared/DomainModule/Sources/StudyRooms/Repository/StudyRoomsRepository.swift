import Combine
import DataMappingModule
import ErrorModule

public protocol StudyRoomsRepository {
    func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, DmsError>
    func fetchSeatTypes(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], DmsError>
    func fetchStudyRoomList(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], DmsError>
    func fetchDetailStudyRoom(roomID: String, timeSlot: String) -> AnyPublisher<DetailStudyRoomEntity, DmsError>
    func applyStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, DmsError>
    func cancelStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, DmsError>
    func fetchMyStudyRoomApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError>
    func fetchStudyroomTimeList() -> AnyPublisher<StudyroomTimeListEntity, DmsError>
}
