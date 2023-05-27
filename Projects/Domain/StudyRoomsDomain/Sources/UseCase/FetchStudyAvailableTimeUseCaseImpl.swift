import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchStudyAvailableTimeUseCaseImpl: FetchStudyAvailableTimeUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute() -> AnyPublisher<StudyAvailableTimeEntity, Error> {
        studyRoomsRepository.fetchStudyAvailableTime()
    }
}
