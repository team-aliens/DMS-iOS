import Combine
import DataMappingModule
import ErrorModule

public protocol FetchDetailStudyRoomUseCase {
    func execute() -> AnyPublisher<DetailStudyRoomEntity, DmsError>
}
