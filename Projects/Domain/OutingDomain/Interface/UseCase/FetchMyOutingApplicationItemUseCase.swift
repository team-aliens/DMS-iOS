import Combine

public protocol FetchMyOutingApplicationItemUseCase {
    func execute() -> AnyPublisher<Void, Error>
}
