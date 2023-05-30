import Combine
import BaseDomain
import StudyRoomsDomainInterface

public final class RemoteStudyRoomsDataSourceImpl: BaseRemoteDataSource<StudyRoomsAPI>, RemoteStudyRoomsDataSource {
    public func fetchStudyroomTimeList() -> AnyPublisher<StudyroomTimeListEntity, Error> {
        request(.fetchStudyroomTimeList, dto: FetchStudyRoomTimeListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchMyRemainApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, Error> {
        request(.fetchMyStudyRoomApplicationItems, dto: FetchMyStudyRoomApplicationItemsDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, Error> {
        request(.fetchStudyAvailableTime, dto: FetchStudyAvailableTimeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchSeatTypes(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], Error> {
        request(.fetchSeatTypes(studyroomID: studyroomID), dto: FetchSeatTypesResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchStudyRoomList(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], Error> {
        request(.fetchStudyRoomList(timeSlot: timeSlot), dto: FetchStudyRoomListResponDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchDetailStudyRoom(
        roomID: String,
        timeSlot: String
    ) -> AnyPublisher<DetailStudyRoomEntity, Error> {
        request(.fetchDetailStudyRoom(roomID: roomID, timeSlot: timeSlot), dto: FetchDetailStudyRoomResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func applyStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error> {
        request(.applyStudyRoomSeat(seatID: seatID, timeSlot: timeSlot))
    }

    public func cancelStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error> {
        request(.cancelStudyRoomSeat(seatID: seatID, timeSlot: timeSlot))
    }
}
