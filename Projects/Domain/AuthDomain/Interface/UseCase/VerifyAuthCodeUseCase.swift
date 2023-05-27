import Combine
import DataMappingModule
import ErrorModule

public protocol VerifyAuthCodeUseCase {
    func execute(req: VerifyAuthCodeRequestDTO) -> AnyPublisher<Void, Error>
}
