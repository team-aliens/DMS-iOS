import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public protocol RemoteStudyRoomsDataSource {
    func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, DmsError>
    func fetchSeatTypes(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], DmsError>
    func fetchStudyRoomList(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], DmsError>
    func fetchDetailStudyRoom(roomID: String, timeSlot: String) -> AnyPublisher<DetailStudyRoomEntity, DmsError>
    func applyStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, DmsError>
    func cancelStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, DmsError>
    func fetchMyRemainApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError>
    func fetchStudyroomTimeList() -> AnyPublisher<StudyroomTimeListEntity, DmsError>
}
