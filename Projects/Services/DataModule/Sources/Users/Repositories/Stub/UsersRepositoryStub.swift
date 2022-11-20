import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule
import Foundation

public struct UsersRepositoryStub: UsersRepository {
    public init() {}

    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
