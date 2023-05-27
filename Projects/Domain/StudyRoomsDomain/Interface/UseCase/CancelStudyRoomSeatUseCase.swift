import Combine
import DataMappingModule
import ErrorModule

public protocol CancelStudyRoomSeatUseCase {
    func execute(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error>
}
