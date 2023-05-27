import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public struct RemoteUsersDataSourceStub: RemoteUsersDataSource {
    public init() {}

    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }

    public func compareCurrentPasssword(password: String) -> AnyPublisher<Void, Error> {
        Just(()).setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }
}
