import APIKit
import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public final class RemoteNoticeDataSourceImpl: BaseRemoteDataSource<NoticeAPI>, RemoteNoticeDataSource {
    public func fetchWhetherNewNotice() -> AnyPublisher<Bool, DmsError> {
        request(.fetchWhetherNewNotice, dto: FetchWhetherNewNoticeResponseDTO.self)
            .map(\.whetherNewNotice)
            .eraseToAnyPublisher()
    }

    public func fetchNoticeList(order: NoticeOrderType) -> AnyPublisher<[NoticeEntity], DmsError> {
        request(.fetchNoticeList(order: order), dto: FetchNoticeListResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchDetailNotice(id: String) -> AnyPublisher<DetailNoticeEntity, DmsError> {
        request(.fetchDetailNotice(id: id), dto: FetchDetailNoticeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
