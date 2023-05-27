import NoticeDomainInterface
import BaseDomain
import Combine

public final class RemoteNoticeDataSourceImpl: BaseRemoteDataSource<NoticeAPI>, RemoteNoticeDataSource {
    public func fetchWhetherNewNotice() -> AnyPublisher<Bool, Error> {
        request(.fetchWhetherNewNotice, dto: FetchWhetherNewNoticeResponseDTO.self)
            .map(\.whetherNewNotice)
            .eraseToAnyPublisher()
    }

    public func fetchNoticeList(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], Error> {
        request(.fetchNoticeList(order: order), dto: FetchNoticeListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchDetailNotice(id: String) -> AnyPublisher<DetailNoticeEntity, Error> {
        request(.fetchDetailNotice(id: id), dto: FetchDetailNoticeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
