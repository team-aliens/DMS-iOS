import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct StudyRoomsRepositoryImpl: StudyRoomsRepository {
    private let remoteStudyRoomsDataSource: any RemoteStudyRoomsDataSource

    public init(remoteStudyRoomsDataSource: any RemoteStudyRoomsDataSource) {
        self.remoteStudyRoomsDataSource = remoteStudyRoomsDataSource
    }

    public func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, Error> {
        remoteStudyRoomsDataSource.fetchStudyAvailableTime()
    }

    public func fetchSeatTypes(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], Error> {
        remoteStudyRoomsDataSource.fetchSeatTypes(studyroomID: studyroomID)
    }

    public func fetchStudyRoomList(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], Error> {
        remoteStudyRoomsDataSource.fetchStudyRoomList(timeSlot: timeSlot)
    }

    public func fetchDetailStudyRoom(
        roomID: String,
        timeSlot: String
    ) -> AnyPublisher<DetailStudyRoomEntity, Error> {
        remoteStudyRoomsDataSource.fetchDetailStudyRoom(roomID: roomID, timeSlot: timeSlot)
    }

    public func applyStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error> {
        remoteStudyRoomsDataSource.applyStudyRoomSeat(seatID: seatID, timeSlot: timeSlot)
    }

    public func cancelStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error> {
        remoteStudyRoomsDataSource.cancelStudyRoomSeat(seatID: seatID, timeSlot: timeSlot)
    }

    public func fetchMyStudyRoomApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, Error> {
        remoteStudyRoomsDataSource.fetchMyRemainApplicationItems()
    }

    public func fetchStudyroomTimeList() -> AnyPublisher<StudyroomTimeListEntity, Error> {
        remoteStudyRoomsDataSource.fetchStudyroomTimeList()
    }
}
