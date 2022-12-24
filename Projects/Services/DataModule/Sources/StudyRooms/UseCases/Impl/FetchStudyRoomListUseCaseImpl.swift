import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchStudyRoomListUseCaseImpl: FetchStudyRoomListUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute() -> AnyPublisher<[StudyRoomEntity], DmsError> {
        studyRoomsRepository.fetchStudyRoomList()
    }
}
