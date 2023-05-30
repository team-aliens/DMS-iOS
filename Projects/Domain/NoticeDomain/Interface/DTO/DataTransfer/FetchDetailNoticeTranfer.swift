import Combine
import Foundation

public extension FetchDetailNoticeResponseDTO {
    func toDomain() -> DetailNoticeEntity {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "ko_kr")
        let date: Date = formatter.date(from: createdAt) ?? .init()
        return DetailNoticeEntity(
            title: title,
            content: content,
            createdAt: date
        )
    }
}
