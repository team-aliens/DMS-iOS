import Combine

public protocol OutingRepository {
    func fetchMyOutingApplicationItem() -> AnyPublisher<Void, Error>
}
