import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public protocol RemoteStudyRoomsDataSource {
    func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, Error>
    func fetchSeatTypes(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], Error>
    func fetchStudyRoomList(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], Error>
    func fetchDetailStudyRoom(roomID: String, timeSlot: String) -> AnyPublisher<DetailStudyRoomEntity, Error>
    func applyStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error>
    func cancelStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error>
    func fetchMyRemainApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, Error>
    func fetchStudyroomTimeList() -> AnyPublisher<StudyroomTimeListEntity, Error>
}
