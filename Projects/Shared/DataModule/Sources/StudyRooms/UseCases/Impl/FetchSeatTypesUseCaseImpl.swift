import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct FetchSeatTypesUseCaseImpl: FetchSeatTypesUseCase {
    private let studyRoomsRepository: any StudyRoomsRepository

    public init(studyRoomsRepository: any StudyRoomsRepository) {
        self.studyRoomsRepository = studyRoomsRepository
    }

    public func execute(studyroomID: String) -> AnyPublisher<[SeatTypeEntity], DmsError> {
        studyRoomsRepository.fetchSeatTypes(studyroomID: studyroomID)
    }
}
