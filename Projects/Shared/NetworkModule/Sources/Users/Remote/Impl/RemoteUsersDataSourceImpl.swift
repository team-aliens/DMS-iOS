import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteUsersDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteUsersDataSource {
    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        request(.changePassword(req))
    }

    public func compareCurrentPasssword(password: String) -> AnyPublisher<Void, DmsError> {
        request(.compareCurrentPasssword(password: password))
    }
}
