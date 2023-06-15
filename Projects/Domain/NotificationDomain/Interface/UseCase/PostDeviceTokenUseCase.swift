import Combine

public protocol PostDeviceTokenUseCase {
    func execute(token: String) -> AnyPublisher<Void, Error>
}
