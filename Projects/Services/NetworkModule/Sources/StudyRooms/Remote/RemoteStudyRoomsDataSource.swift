import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public protocol RemoteStudyRoomsDataSource {
    func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, DmsError>
    func fetchSeatTypes() -> AnyPublisher<[SeatTypeEntity], DmsError>
    func fetchStudyRoomList() -> AnyPublisher<[StudyRoomEntity], DmsError>
    func fetchDetailStudyRoom(roomID: String) -> AnyPublisher<DetailStudyRoomEntity, DmsError>
    func applyStudyRoomSeat(seatID: String) -> AnyPublisher<Void, DmsError>
    func cancelStudyRoomSeat() -> AnyPublisher<Void, DmsError>
    func fetchMyRemainApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError>
    func fetchStudyroomTimeList() -> AnyPublisher<StudyroomTimeListEntity, DmsError>
}
