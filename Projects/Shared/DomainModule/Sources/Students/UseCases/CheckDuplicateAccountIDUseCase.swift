import Combine
import DataMappingModule
import ErrorModule

public protocol CheckDuplicateAccountIDUseCase {
    func execute(id: String) -> AnyPublisher<Void, DmsError>
}
