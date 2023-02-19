import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteRemainsDataSourceImpl: BaseRemoteDataSource<StudyRoomsAPI>, RemoteStudyRoomsDataSource {
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

    public func fetchStudyRoomList() -> AnyPublisher<[StudyRoomEntity], DmsError> {
        request(.fetchStudyRoomList, dto: FetchStudyRoomListResponDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchDetailStudyRoom(roomID: String) -> AnyPublisher<DetailStudyRoomEntity, DmsError> {
        request(.fetchDetailStudyRoom(roomID: roomID), dto: FetchDetailStudyRoomResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func applyStudyRoomSeat(seatID: String) -> AnyPublisher<Void, DmsError> {
        request(.applyStudyRoomSeat(seatID: seatID))
    }

    public func cancelStudyRoomSeat() -> AnyPublisher<Void, DmsError> {
        request(.cancelStudyRoomSeat)
    }
}
