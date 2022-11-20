import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public protocol RemoteUsersDataSource {
    func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, DmsError>
}
