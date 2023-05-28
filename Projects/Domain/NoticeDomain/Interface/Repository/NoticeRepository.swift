import Combine

public protocol NoticeRepository {
    func fetchWhetherNewNotice() -> AnyPublisher<Bool, Error>
    func fetchNoticeList(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], Error>
    func fetchDetailNotice(id: String) -> AnyPublisher<DetailNoticeEntity, Error>
}
