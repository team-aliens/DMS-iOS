import Combine
import StudyRoomsDomainInterface

public struct FetchSeatTypesUseCaseImpl: FetchSeatTypesUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], Error> {
        studyRoomsRepository.fetchSeatTypes(studyroomID: studyroomID)
    }
}
