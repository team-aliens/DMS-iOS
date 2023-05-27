import Combine
import DataMappingModule
import ErrorModule

public protocol ApplyStudyRoomSeatUseCase {
    func execute(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error>
}
