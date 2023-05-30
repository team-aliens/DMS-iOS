import Combine
import StudyRoomsDomainInterface

public struct FetchStudyAvailableTimeUseCaseImpl: FetchStudyAvailableTimeUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute() -> AnyPublisher<StudyAvailableTimeEntity, Error> {
        studyRoomsRepository.fetchStudyAvailableTime()
    }
}
