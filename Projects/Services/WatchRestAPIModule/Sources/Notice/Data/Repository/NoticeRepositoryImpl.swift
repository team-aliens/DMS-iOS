import Foundation

public struct NoticeRepositoryImpl: NoticeRepository {
    private let remoteDataSource: any RemoteNoticeDataSource

    public init(remoteDataSource: any RemoteNoticeDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    public func fetchNoticeList(order: NoticeOrderType) async throws -> [NoticeEntity] {
        return try await remoteDataSource.fetchNoticeList(order: order)
    }

    public func fetchDetailNotice(id: String) async throws -> DetailNoticeEntity {
        return try await remoteDataSource.fetchDetailNotice(id: id)
    }
}
