import Foundation

public final class RemoteNoticeDataSourceImpl: BaseRemoteDataSource<NoticeAPI>, RemoteNoticeDataSource {
    public func fetchNoticeList(order: NoticeOrderType) async throws -> [NoticeEntity] {
        let response = try await request(
            .fetchNoticeList(order: order),
            dto: FetchNoticeListResponseDTO.self
        )
        return response.toDomain()
    }

    public func fetchDetailNotice(id: String) async throws -> DetailNoticeEntity {
        let response = try await request(
            .fetchDetailNotice(id: id),
            dto: FetchDetailNoticeResponseDTO.self
        )
        return response.toDomain()
    }
}
