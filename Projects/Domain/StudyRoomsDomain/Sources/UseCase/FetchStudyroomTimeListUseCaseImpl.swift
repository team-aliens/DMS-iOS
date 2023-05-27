import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchStudyroomTimeListUseCaseImpl: FetchStudyroomTimeListUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute() -> AnyPublisher<StudyroomTimeListEntity, Error> {
        studyRoomsRepository.fetchStudyroomTimeList()
    }
}
