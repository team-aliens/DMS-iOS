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

    public func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, DmsError> {
        remoteStudyRoomsDataSource.fetchStudyAvailableTime()
    }

    public func fetchSeatTypes() -> AnyPublisher<[SeatTypeEntity], DmsError> {
        remoteStudyRoomsDataSource.fetchSeatTypes()
    }

    public func fetchStudyRoomList() -> AnyPublisher<[StudyRoomEntity], DmsError> {
        remoteStudyRoomsDataSource.fetchStudyRoomList()
    }

    public func fetchDetailStudyRoom(roomID: String) -> AnyPublisher<DetailStudyRoomEntity, DmsError> {
        remoteStudyRoomsDataSource.fetchDetailStudyRoom(roomID: roomID)
    }

    public func applyStudyRoomSeat(seatID: String) -> AnyPublisher<Void, DmsError> {
        remoteStudyRoomsDataSource.applyStudyRoomSeat(seatID: seatID)
    }

    public func cancelStudyRoomSeat() -> AnyPublisher<Void, DmsError> {
        remoteStudyRoomsDataSource.cancelStudyRoomSeat()
    }

    public func fehtchMyStudyRoomApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError> {
        remoteStudyRoomsDataSource.fetchMyRemainApplicationItems()
    }
}
