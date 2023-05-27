import Combine
import DataMappingModule
import ErrorModule

public protocol CheckAccountIDIsExistUseCase {
    func execute(id: String) -> AnyPublisher<String, Error>
}
