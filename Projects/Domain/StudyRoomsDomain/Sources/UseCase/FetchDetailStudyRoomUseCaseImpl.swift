import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchDetailStudyRoomUseCaseImpl: FetchDetailStudyRoomUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute(roomID: String, timeSlot: String) -> AnyPublisher<DetailStudyRoomEntity, Error> {
        studyRoomsRepository.fetchDetailStudyRoom(roomID: roomID, timeSlot: timeSlot)
    }
}
