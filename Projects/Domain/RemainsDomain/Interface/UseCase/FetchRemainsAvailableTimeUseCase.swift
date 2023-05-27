import Combine
import DataMappingModule
import ErrorModule

public protocol FetchRemainsAvailableTimeUseCase {
    func execute() -> AnyPublisher<RemainsAvailableTimeEntity, Error>
}
