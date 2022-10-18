import Combine
import DataMappingModule
import ErrorModule

public protocol FindIDUseCase {
    func execute(req: FindIDRequestDTO) -> AnyPublisher<String, DmsError>
}
