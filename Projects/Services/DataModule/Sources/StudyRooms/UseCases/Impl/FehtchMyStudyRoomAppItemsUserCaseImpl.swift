import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchMyStudyRoomAppItemsUserCaseImpl: FetchMyStudyRoomAppItemsUserCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute() -> AnyPublisher<MyStudyRoomAppItemsEntity, DmsError> {
        studyRoomsRepository.fehtchMyStudyRoomApplicationItems()
    }
}
