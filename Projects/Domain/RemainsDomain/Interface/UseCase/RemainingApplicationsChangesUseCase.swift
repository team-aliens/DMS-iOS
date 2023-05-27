import Combine
import DataMappingModule
import ErrorModule

public protocol RemainingApplicationsChangesUseCase {
    func execute(id: String) -> AnyPublisher<Void, Error>
}
