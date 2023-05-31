import Combine
import Foundation

public extension FetchNoticeListResponseDTO {
    func toDomain() -> [NoticeEntity] {
        notices.map { $0.toDomain() }
    }
}

public extension SingleNoticeResponseDTO {
    func toDomain() -> NoticeEntity {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [ .withFullDate, .withDashSeparatorInDate ]
        let date = formatter.date(from: createdAt) ?? .init()
        return NoticeEntity(
            id: id,
            title: title,
            createdAt: date
        )
    }
}
