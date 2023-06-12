import Combine

public protocol FetchStudyRoomListUseCase {
    func execute(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], Error>
}
