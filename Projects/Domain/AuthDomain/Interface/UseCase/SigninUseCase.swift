import Combine
import DataMappingModule
import ErrorModule

public protocol SigninUseCase {
    func execute(req: SigninRequestDTO) -> AnyPublisher<DmsFeatures, Error>
}
