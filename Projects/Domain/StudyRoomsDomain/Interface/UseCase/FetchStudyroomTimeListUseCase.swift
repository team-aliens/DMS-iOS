import Combine
import DataMappingModule
import ErrorModule

public protocol FetchStudyroomTimeListUseCase {
    func execute() -> AnyPublisher<StudyroomTimeListEntity, Error>
}
