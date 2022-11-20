import Combine
import DataMappingModule
import ErrorModule

public protocol UsersRepository {
    func changePassword(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, DmsError>
}
