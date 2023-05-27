import Combine
import DataMappingModule
import ErrorModule

public protocol FetchNoticeListUseCase {
    func execute(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], Error>
}
