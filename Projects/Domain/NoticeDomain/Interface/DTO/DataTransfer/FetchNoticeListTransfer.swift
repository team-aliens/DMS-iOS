import Combine

public extension FetchNoticeListResponseDTO {
    func toDomain() -> [NoticeEntity] {
        notices.map { $0.toDomain() }
    }
}

public extension SingleNoticeResponseDTO {
    func toDomain() -> NoticeEntity {
        NoticeEntity(
            id: id,
            title: title,
            createdAt: createdAt
        )
    }
}
