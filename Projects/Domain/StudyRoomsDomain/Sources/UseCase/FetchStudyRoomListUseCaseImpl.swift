import Combine
import StudyRoomsDomainInterface

public struct FetchStudyRoomListUseCaseImpl: FetchStudyRoomListUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute(timeSlot: String?) -> AnyPublisher<[StudyRoomEntity], Error> {
        studyRoomsRepository.fetchStudyRoomList(timeSlot: timeSlot)
    }
}
