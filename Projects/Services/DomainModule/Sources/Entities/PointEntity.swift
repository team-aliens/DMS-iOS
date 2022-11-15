import Foundation

public struct PointEntity: Equatable, Hashable {
    public init(
        pointID: String,
        date: String,
        type: String,
        name: String,
        score: Int
    ) {
        self.pointID = pointID
        self.date = date
        self.type = type
        self.name = name
        self.score = score
    }

    public let pointID: String
    public let date: String
    public let type: String
    public let name: String
    public let score: Int
}
