import Foundation

// swiftlint:disable unneeded_synthesized_initializer
struct FetchDetailNoticeResponseDTO: Decodable {
    init(title: String, content: String, createdAt: String) {
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }

    let title: String
    let content: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case title, content
        case createdAt = "created_at"
    }
}

extension FetchDetailNoticeResponseDTO {
    func toDomain() -> DetailNoticeEntity {
        DetailNoticeEntity(
            title: title,
            content: content,
            createdAt: createdAt.toDMSDate()
        )
    }
}
// swiftlint:enable unneeded_synthesized_initializer
