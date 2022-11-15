import DataMappingModule
import DomainModule

public extension SinglePointResponseDTO {
    func toDomain() -> PointEntity {
        PointEntity(
            pointID: pointID,
            date: date,
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
