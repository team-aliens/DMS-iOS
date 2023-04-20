import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct UsersRepositoryImpl: UsersRepository {
    private let remoteUsersDataSource: any RemoteUsersDataSource

    public init(remoteUsersDataSource: any RemoteUsersDataSource) {
        self.remoteUsersDataSource = remoteUsersDataSource
    }

    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        remoteUsersDataSource.changePassword(req: req)
    }

    public func compareCurrentPasssword(password: String) -> AnyPublisher<Void, DmsError> {
        remoteUsersDataSource.compareCurrentPasssword(password: password)
    }
}
