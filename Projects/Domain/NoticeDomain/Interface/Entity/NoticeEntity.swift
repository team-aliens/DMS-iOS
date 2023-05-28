import Foundation

public struct NoticeEntity: Equatable, Hashable {
    public init(id: String, title: String, createdAt: String) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
    }

    public let id: String
    public let title: String
    public let createdAt: String
}
