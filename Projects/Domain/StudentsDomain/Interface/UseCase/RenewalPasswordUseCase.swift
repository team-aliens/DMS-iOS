import Combine
import DataMappingModule
import ErrorModule

public protocol RenewalPasswordUseCase {
    func execute(req: RenewalPasswordRequestDTO) -> AnyPublisher<Void, Error>
}
