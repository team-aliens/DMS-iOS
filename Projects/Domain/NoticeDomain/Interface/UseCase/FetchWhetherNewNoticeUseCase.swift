import Combine
import DataMappingModule
import ErrorModule

public protocol FetchWhetherNewNoticeUseCase {
    func execute() -> AnyPublisher<Bool, Error>
}
