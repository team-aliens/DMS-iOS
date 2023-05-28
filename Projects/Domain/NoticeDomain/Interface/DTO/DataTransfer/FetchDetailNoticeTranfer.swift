import Combine

public extension FetchDetailNoticeResponseDTO {
    func toDomain() -> DetailNoticeEntity {
        DetailNoticeEntity(
            title: title,
            content: content,
            createdAt: createdAt
        )
    }
}
