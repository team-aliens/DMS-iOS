import Combine
import StudyRoomsDomainInterface

public struct ApplyStudyRoomSeatUseCaseImpl: ApplyStudyRoomSeatUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute(seatID: String, timeSlot: String) -> AnyPublisher<Void, Error> {
        studyRoomsRepository.applyStudyRoomSeat(seatID: seatID, timeSlot: timeSlot)
    }
}
