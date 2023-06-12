import Combine
import StudyRoomsDomainInterface

public struct FetchMyStudyRoomAppItemsUseCaseImpl: FetchMyStudyRoomAppItemsUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute() -> AnyPublisher<MyStudyRoomAppItemsEntity, Error> {
        studyRoomsRepository.fetchMyStudyRoomApplicationItems()
    }
}
