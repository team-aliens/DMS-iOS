import Combine

public protocol RemoteOutingDataSource {
    func fetchMyOutingApplicationItem() -> AnyPublisher<Void, Error>
}
