import Combine
import DataMappingModule
import ErrorModule

public protocol FetchStudyRoomListUseCase {
    func execute(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], DmsError>
}
