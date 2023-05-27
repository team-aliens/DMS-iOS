import Combine
import DataMappingModule
import ErrorModule

public protocol FetchStudyAvailableTimeUseCase {
    func execute() -> AnyPublisher<StudyAvailableTimeEntity, Error>
}
