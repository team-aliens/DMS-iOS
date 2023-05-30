import Combine
import NoticeDomainInterface

public struct NoticeRepositoryImpl: NoticeRepository {
    private let remoteNoticeDataSource: any RemoteNoticeDataSource

    public init(remoteNoticeDataSource: any RemoteNoticeDataSource) {
        self.remoteNoticeDataSource = remoteNoticeDataSource
    }

    public func fetchWhetherNewNotice() -> AnyPublisher<Bool, Error> {
        remoteNoticeDataSource.fetchWhetherNewNotice()
    }

    public func fetchNoticeList(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], Error> {
        remoteNoticeDataSource.fetchNoticeList(order: order)
    }

    public func fetchDetailNotice(id: String) -> AnyPublisher<DetailNoticeEntity, Error> {
        remoteNoticeDataSource.fetchDetailNotice(id: id)
    }
}
