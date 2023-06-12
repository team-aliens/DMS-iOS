import Combine
import UsersDomainInterface

public struct UsersRepositoryImpl: UsersRepository {
    private let remoteUsersDataSource: any RemoteUsersDataSource

    public init(remoteUsersDataSource: any RemoteUsersDataSource) {
        self.remoteUsersDataSource = remoteUsersDataSource
    }

    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        remoteUsersDataSource.changePassword(req: req)
    }

    public func compareCurrentPasssword(password: String) -> AnyPublisher<Void, Error> {
        remoteUsersDataSource.compareCurrentPasssword(password: password)
    }
}
