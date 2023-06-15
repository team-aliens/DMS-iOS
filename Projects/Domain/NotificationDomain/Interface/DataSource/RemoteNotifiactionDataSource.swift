import Combine

public protocol RemoteNotificationDataSource {
    func postDeviceToken(token: String) -> AnyPublisher<Void, Error>
}
