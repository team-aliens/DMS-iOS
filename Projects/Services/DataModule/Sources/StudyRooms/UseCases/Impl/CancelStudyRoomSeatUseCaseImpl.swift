import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct CancelStudyRoomSeatUseCaseImpl: CancelStudyRoomSeatUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute(timeSlot: String) -> AnyPublisher<Void, DmsError> {
        studyRoomsRepository.cancelStudyRoomSeat(timeSlot: timeSlot)
    }
}
