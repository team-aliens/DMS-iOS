import Combine

public protocol FetchDetailStudyRoomUseCase {
    func execute(roomID: String, timeSlot: String) -> AnyPublisher<DetailStudyRoomEntity, Error>
}
