import Foundation

public protocol NoticeRepository {
    func fetchNoticeList(order: NoticeOrderType) async throws -> [NoticeEntity]
    func fetchDetailNotice(id: String) async throws -> DetailNoticeEntity
}
