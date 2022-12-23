import Combine
import DataMappingModule
import ErrorModule

public protocol FetchStudyRoomListUseCase {
    func execute() -> AnyPublisher<[StudyRoomEntity], DmsError>
}
