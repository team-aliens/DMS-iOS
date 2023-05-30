import Combine
import Foundation

public extension FetchPointListResponseDTO.SinglePointResponseDTO {
    func toDomain() -> PointEntity.SinglePoint {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "ko_kr")
        let date: Date = formatter.date(from: date) ?? .init()
        return PointEntity.SinglePoint(
            pointID: pointID,
            date: date,
            type: PointsType(rawValue: type) ?? .bonus,
            name: name,
            score: score
        )
    }
}

public extension FetchPointListResponseDTO {
    func toDomain() -> PointEntity {
        PointEntity(
            totalPoint: totalPoint,
            poinsts: pointHistories.map { $0.toDomain() }
        )
    }
}
