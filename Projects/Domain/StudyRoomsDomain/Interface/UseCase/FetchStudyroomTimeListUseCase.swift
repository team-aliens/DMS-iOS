import Combine

public protocol FetchStudyroomTimeListUseCase {
    func execute() -> AnyPublisher<StudyroomTimeListEntity, Error>
}
