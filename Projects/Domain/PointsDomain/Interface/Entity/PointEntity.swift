import Combine
import Foundation

public struct PointEntity: Equatable, Hashable {
    public init(totalPoint: Int, poinsts: [SinglePoint]) {
        self.totalPoint = totalPoint
        self.poinsts = poinsts
    }

    public let totalPoint: Int
    public let poinsts: [SinglePoint]

    public struct SinglePoint: Equatable, Hashable {
        public init(
            pointID: String,
            date: String,
            type: PointsType,
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
        public let type: PointsType
        public let name: String
        public let score: Int
    }
}
