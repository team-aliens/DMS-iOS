import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import Foundation

public struct RemoteUsersDataSourceStub: RemoteUsersDataSource {
    public init() {}

    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
                .eraseToAnyPublisher()
    }
}
