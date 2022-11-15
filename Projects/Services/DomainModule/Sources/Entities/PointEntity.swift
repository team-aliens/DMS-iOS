import Foundation

public struct PointEntity: Equatable, Hashable {
    public init(
        id: String,
        date: Date,
        type: String,
        name: String,
        score: Int
    ) {
        self.id = id
        self.date = date
        self.type = type
        self.name = name
        self.score = score
    }

    public let id: String
    public let date: Date
    public let type: String
    public let name: String
    public let score: Int
}
