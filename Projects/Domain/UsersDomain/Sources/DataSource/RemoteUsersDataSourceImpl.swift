import Combine
import BaseDomain
import UsersDomainInterface

public final class RemoteUsersDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteUsersDataSource {
    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, Error> {
        request(.changePassword(req))
    }

    public func compareCurrentPasssword(password: String) -> AnyPublisher<Void, Error> {
        request(.compareCurrentPasssword(password: password))
    }
}
