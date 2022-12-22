import Combine
import DataMappingModule
import ErrorModule

public protocol ApplyStudyRoomSeatUseCase {
    func execute() -> AnyPublisher<Void, DmsError>
}
