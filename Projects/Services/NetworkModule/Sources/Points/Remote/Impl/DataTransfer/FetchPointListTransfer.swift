import DataMappingModule
import DomainModule
import Utility

public extension SinglePointResponseDTO {
    func toDomain() -> PointEntity {
        PointEntity(
            pointID: pointID,
            date: date.toDMSDate(),
            type: type,
            name: name,
            score: score
        )
    }
}

public extension FetchPointListResponseDTO {
    func toDomain() -> [PointEntity] {
        points.map { $0.toDomain() }
    }
}
