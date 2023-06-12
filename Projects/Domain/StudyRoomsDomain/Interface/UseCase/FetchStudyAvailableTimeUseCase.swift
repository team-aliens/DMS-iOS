import Combine

public protocol FetchStudyAvailableTimeUseCase {
    func execute() -> AnyPublisher<StudyAvailableTimeEntity, Error>
}
