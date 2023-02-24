import DataMappingModule
import DomainModule

public extension FetchRemainsAvailableTimeResponseDTO {
    func toDomain() -> RemainsAvailableTimeEntity {
        RemainsAvailableTimeEntity(
            startDayOfWeek: startDayOfWeek,
            startAt: startAt,
            endDayOfWeek: endDayOfWeek,
            endAt: endAt
        )
    }
}
