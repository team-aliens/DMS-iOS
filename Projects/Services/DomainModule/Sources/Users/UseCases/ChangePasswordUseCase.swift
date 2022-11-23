import Combine
import DataMappingModule
import ErrorModule

public protocol ChangePasswordUseCase {
    func execute(req: ChangePasswordRequestDTO) -> AnyPublisher<Void, DmsError>
}
