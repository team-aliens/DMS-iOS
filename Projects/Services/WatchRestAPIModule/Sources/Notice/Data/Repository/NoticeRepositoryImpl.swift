import Foundation

public struct NoticeRepositoryImpl: NoticeRepository {
    private let provider: any RemoteAPIProvider

    public init(provider: any RemoteAPIProvider) {
        self.provider = provider
    }

    public func fetchNoticeList(order: NoticeOrderType) async throws -> [NoticeEntity] {
        let response = try await provider.request(
            NoticeAPI.fetchNoticeList(order: order),
            dto: FetchNoticeListResponseDTO.self
        )
        
    }

    public func fetchDetailNotice(id: String) async throws -> DetailNoticeEntity {
        
    }
}
