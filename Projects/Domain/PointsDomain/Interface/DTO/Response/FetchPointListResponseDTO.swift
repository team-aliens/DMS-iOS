import Foundation

// swiftlint: disable nesting
public struct FetchPointListResponseDTO: Decodable {
    public init(
        totalPoint: Int,
        pointHistories: [SinglePointResponseDTO]
    ) {
        self.totalPoint = totalPoint
        self.pointHistories = pointHistories
    }

    public let totalPoint: Int
    public let pointHistories: [SinglePointResponseDTO]

    enum CodingKeys: String, CodingKey {
        case totalPoint = "total_point"
        case pointHistories = "point_histories"
    }

    public struct SinglePointResponseDTO: Decodable {
        public init(
            pointID: String,
            date: Date,
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
        public let date: Date
        public let type: String
        public let name: String
        public let score: Int

        enum CodingKeys: String, CodingKey {
            case pointID = "point_history_id"
            case date, type, name, score
        }
    }
}
