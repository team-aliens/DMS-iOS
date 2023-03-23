import Combine
import DataMappingModule
import ErrorModule

public protocol CancelStudyRoomSeatUseCase {
    func execute(timeSlot: String) -> AnyPublisher<Void, DmsError>
}
