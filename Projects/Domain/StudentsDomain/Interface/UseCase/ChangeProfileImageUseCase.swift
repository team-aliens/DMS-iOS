import Combine
import DataMappingModule
import ErrorModule

public protocol ChangeProfileImageUseCase {
    func execute(url: String) -> AnyPublisher<Void, DmsError>
}
