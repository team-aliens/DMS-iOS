import Combine

public protocol RemainingApplicationsChangesUseCase {
    func execute(id: String) -> AnyPublisher<Void, Error>
}
