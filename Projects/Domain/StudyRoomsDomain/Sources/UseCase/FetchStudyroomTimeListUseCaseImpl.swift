import Combine
import StudyRoomsDomainInterface

public struct FetchStudyroomTimeListUseCaseImpl: FetchStudyroomTimeListUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute() -> AnyPublisher<StudyroomTimeListEntity, Error> {
        studyRoomsRepository.fetchStudyroomTimeList()
    }
}
