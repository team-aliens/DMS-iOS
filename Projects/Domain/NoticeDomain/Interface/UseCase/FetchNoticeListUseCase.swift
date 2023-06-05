import Combine

public protocol FetchNoticeListUseCase {
    func execute(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], Error>
}
