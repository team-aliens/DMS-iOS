import Combine
import DataMappingModule
import ErrorModule

public protocol SignupUseCase {
    func execute(req: SignupRequestDTO) -> AnyPublisher<DmsFeatures, Error>
}
