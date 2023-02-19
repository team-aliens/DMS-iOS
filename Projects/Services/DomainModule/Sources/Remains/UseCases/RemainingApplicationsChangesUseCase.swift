import Combine
import DataMappingModule
import ErrorModule

public protocol RemainingApplicationsChangesUseCase {
    func execute() -> AnyPublisher<Void, DmsError>
}
