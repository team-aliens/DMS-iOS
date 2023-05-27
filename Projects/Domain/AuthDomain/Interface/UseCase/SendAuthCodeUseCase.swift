import Combine
import DataMappingModule
import ErrorModule

public protocol SendAuthCodeUseCase {
    func execute(req: SendAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
}
