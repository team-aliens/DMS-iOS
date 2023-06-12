import Combine

public protocol CancelStudyRoomSeatUseCase {
    func execute(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error>
}
