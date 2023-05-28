import Foundation

public extension FetchSeatTypesResponseDTO {
    func toDomain() -> [SeatTypeEntity] {
        types.map { $0.toDomain() }
    }
}

public extension SingleSeatTypeResponseDTO {
    func toDomain() -> SeatTypeEntity {
        SeatTypeEntity(
            id: id,
            name: name,
            color: color
        )
    }
}
