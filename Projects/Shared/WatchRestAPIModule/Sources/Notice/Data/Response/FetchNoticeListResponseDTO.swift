import Foundation

// swiftlint: disable nesting
struct FetchNoticeListResponseDTO: Decodable {
    let notices: [SingleNoticeResponseDTO]

    struct SingleNoticeResponseDTO: Decodable {
        let id: String
        let title: String
        let createdAt: String

        enum CodingKeys: String, CodingKey {
            case id, title
            case createdAt = "created_at"
        }
    }
}

extension FetchNoticeListResponseDTO.SingleNoticeResponseDTO {
    func toDomain() -> NoticeEntity {
        NoticeEntity(id: id, title: title, createdAt: createdAt.toDMSDate())
    }
}

extension FetchNoticeListResponseDTO {
    func toDomain() -> [NoticeEntity] {
        notices.map { $0.toDomain() }
    }
}
// swiftlint: enable nesting
