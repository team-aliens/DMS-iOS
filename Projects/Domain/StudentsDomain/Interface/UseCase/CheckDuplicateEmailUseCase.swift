import Combine
import DataMappingModule
import ErrorModule

public protocol CheckDuplicateEmailUseCase {
    func execute(email: String) -> AnyPublisher<Void, Error>
}
