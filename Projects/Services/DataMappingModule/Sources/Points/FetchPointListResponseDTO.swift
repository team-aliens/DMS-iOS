import Foundation

// swiftlint: disable nesting
public struct FetchPointListResponseDTO: Decodable {
    public init(
        totalPoint: Int,
        points: [SinglePointResponseDTO]
    ) {
        self.totalPoint = totalPoint
        self.points = points
    }

    public let totalPoint: Int
    public let points: [SinglePointResponseDTO]

    enum CodingKeys: String, CodingKey {
        case totalPoint = "total_point"
        case points
    }

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
            case pointID = "point_history_id"
            case date, type, name, score
        }
    }
}
