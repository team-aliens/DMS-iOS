import Combine

public protocol FetchRemainsAvailableTimeUseCase {
    func execute() -> AnyPublisher<RemainsAvailableTimeEntity, Error>
}
