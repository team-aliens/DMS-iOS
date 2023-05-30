import Foundation

public struct DetailNoticeEntity: Equatable {
    public init(title: String, content: String, createdAt: Date) {
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }

    public let title: String
    public let content: String
    public let createdAt: Date
}
