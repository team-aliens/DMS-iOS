import Foundation

public struct FetchDetailNoticeResponseDTO: Decodable {
    public init(title: String, content: String, createdAt: String) {
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }

    public let title: String
    public let content: String
    public let createdAt: String

    enum CodingKeys: String, CodingKey {
        case title, content
        case createdAt = "created_at"
    }
}
