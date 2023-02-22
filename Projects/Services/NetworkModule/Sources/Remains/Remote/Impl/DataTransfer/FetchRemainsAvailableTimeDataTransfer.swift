import DataMappingModule
import DomainModule

public extension FetchRemainsAvailableTimeResponseDTO {
    func toDomain() -> RemainsAvailableTimeEntity {
        RemainsAvailableTimeEntity(
            startDayOfWeek: startDayOfWeek.rawValue,
            startAt: startAt,
            endDayOfWeek: endDayOfWeek.rawValue,
            endAt: endAt
        )
    }
}
