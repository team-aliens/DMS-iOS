import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct CancelStudyRoomSeatUseCaseImpl: CancelStudyRoomSeatUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error> {
        studyRoomsRepository.cancelStudyRoomSeat(seatID: seatID, timeSlot: timeSlot)
    }
}
