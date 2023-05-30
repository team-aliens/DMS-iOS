import Combine
import UtilityModule

public extension FetchDetailNoticeResponseDTO {
    func toDomain() -> DetailNoticeEntity {
        DetailNoticeEntity(
            title: title,
            content: content,
            createdAt: createdAt.toDMSDate()
        )
    }
}
