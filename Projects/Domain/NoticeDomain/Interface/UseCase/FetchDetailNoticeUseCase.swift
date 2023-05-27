import Combine
import DataMappingModule
import ErrorModule

public protocol FetchDetailNoticeUseCase {
    func execute(id: String) -> AnyPublisher<DetailNoticeEntity, Error>
}
