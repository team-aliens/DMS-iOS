import Combine
import UtilityModule

public extension FetchPointListResponseDTO.SinglePointResponseDTO {
    func toDomain() -> PointEntity.SinglePoint {
        PointEntity.SinglePoint(
            pointID: pointID,
            date: date.toDMSDate(),
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
