import Foundation

public struct SinglePointResponseDTO: Decodable {
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

    enum CodingKeys: String, CodingKey {
        case date, type, name, score
        case pointID = "point_id"
    }
}
