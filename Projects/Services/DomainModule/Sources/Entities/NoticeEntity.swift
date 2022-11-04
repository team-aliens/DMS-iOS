import Foundation

public struct NoticeEntity: Equatable {
    public init(id: String, title: String, createdAt: Date) {
        self.id = id
        self.title = title
        self.createdAt = createdAt
    }

    public let id: String
    public let title: String
    public let createdAt: Date
}
