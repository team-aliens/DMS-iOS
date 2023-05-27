import Combine
import DataMappingModule
import ErrorModule

public protocol FetchRemainApplicationListUseCase {
    func execute() -> AnyPublisher<RemainApplicationListEntity, Error>
}
