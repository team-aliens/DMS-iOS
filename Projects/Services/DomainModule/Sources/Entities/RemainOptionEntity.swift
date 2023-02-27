import Foundation

public struct RemainOptionEntity: Equatable, Hashable {
    public init(
        id: String,
        title: String,
        description: String,
        isApplied: Bool
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.isApplied = isApplied
    }

    public let id: String
    public let title: String
    public let description: String
    public let isApplied: Bool
}
