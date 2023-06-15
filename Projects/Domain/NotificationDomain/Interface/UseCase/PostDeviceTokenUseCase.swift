import Combine
import DataMappingModule
import ErrorModule

public protocol PostDeviceTokenUseCase {
    func execute(token: String) -> AnyPublisher<Void, Error>
}
