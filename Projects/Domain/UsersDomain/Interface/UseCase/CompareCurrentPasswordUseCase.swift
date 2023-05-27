import Combine
import DataMappingModule
import ErrorModule

public protocol CompareCurrentPasswordUseCase {
    func execute(password: String) -> AnyPublisher<Void, DmsError>
}
