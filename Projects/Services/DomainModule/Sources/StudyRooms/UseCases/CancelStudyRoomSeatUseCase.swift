import Combine
import DataMappingModule
import ErrorModule

public protocol CancelStudyRoomSeatUseCase {
    func execute() -> AnyPublisher<Void, DmsError>
}
