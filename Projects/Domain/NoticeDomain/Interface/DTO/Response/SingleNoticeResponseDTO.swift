import Foundation

public struct SingleNoticeResponseDTO: Decodable {
    public let id: String
    public let title: String
    public let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case createdAt = "created_at"
    }
}
