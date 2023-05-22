import Combine
import DataMappingModule
import ErrorModule

public protocol ReissueTokenUseCase {
    func execute() -> AnyPublisher<DmsFeatures, DmsError>
}
