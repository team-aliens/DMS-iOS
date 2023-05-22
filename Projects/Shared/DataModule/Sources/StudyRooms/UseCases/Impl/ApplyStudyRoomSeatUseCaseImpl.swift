import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct ApplyStudyRoomSeatUseCaseImpl: ApplyStudyRoomSeatUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute(seatID: String, timeSlot: String) -> AnyPublisher<Void, DmsError> {
        studyRoomsRepository.applyStudyRoomSeat(seatID: seatID, timeSlot: timeSlot)
    }
}
