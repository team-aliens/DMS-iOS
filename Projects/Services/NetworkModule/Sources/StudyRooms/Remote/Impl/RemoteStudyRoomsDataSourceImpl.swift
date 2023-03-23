import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteStudyRoomsDataSourceImpl: BaseRemoteDataSource<StudyRoomsAPI>, RemoteStudyRoomsDataSource {
    public func fetchStudyroomTimeList() -> AnyPublisher<StudyroomTimeListEntity, DmsError> {
        request(.fetchStudyroomTimeList, dto: FetchStudyRoomTimeListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchMyRemainApplicationItems() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError> {
        request(.fetchMyStudyRoomApplicationItems, dto: FetchMyStudyRoomApplicationItemsDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchStudyAvailableTime() -> AnyPublisher<StudyAvailableTimeEntity, DmsError> {
        request(.fetchStudyAvailableTime, dto: FetchStudyAvailableTimeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchSeatTypes() -> AnyPublisher<[SeatTypeEntity], DmsError> {
        request(.fetchSeatTypes, dto: FetchSeatTypesResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchStudyRoomList(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], DmsError> {
        request(.fetchStudyRoomList(timeSlot: timeSlot), dto: FetchStudyRoomListResponDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchDetailStudyRoom(
        roomID: String,
        timeSlot: String
    ) -> AnyPublisher<DetailStudyRoomEntity, DmsError> {
        request(.fetchDetailStudyRoom(roomID: roomID, timeSlot: timeSlot), dto: FetchDetailStudyRoomResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func applyStudyRoomSeat(seatID: String, timeSlot: String) -> AnyPublisher<Void, DmsError> {
        request(.applyStudyRoomSeat(seatID: seatID, timeSlot: timeSlot))
    }

    public func cancelStudyRoomSeat(timeSlot: String) -> AnyPublisher<Void, DmsError> {
        request(.cancelStudyRoomSeat(timeSlot: timeSlot))
    }
}
