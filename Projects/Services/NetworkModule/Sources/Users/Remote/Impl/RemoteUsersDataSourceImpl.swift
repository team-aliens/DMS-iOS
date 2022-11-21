import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteUsersDataSourceImpl: BaseRemoteDataSource<UsersAPI>, RemoteUsersDataSource {
    public func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, DmsError> {
        request(.changePassword(req))
    }
}
