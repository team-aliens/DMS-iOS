import Combine

public protocol NotificationRepository {
    func postDeviceToken(token: String) -> AnyPublisher<Void, Error>
}
