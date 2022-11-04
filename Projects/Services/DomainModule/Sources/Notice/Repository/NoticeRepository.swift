import Combine
import DataMappingModule
import ErrorModule

public protocol NoticeRepository {
    func fetchWhetherNewNotice() -> AnyPublisher<Bool, DmsError>
    func fetchNoticeList(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], DmsError>
    func fetchDetailNotice(id: String) -> AnyPublisher<DetailNoticeEntity, DmsError>
}
