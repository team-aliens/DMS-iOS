import DataMappingModule
import DomainModule
import Utility

public extension FetchRemainsAvailableTimeResponseDTO {
    func toDomain() -> RemainsAvailableTimeEntity {
        RemainsAvailableTimeEntity(
            startDayOfWeek: startDayOfWeek,
            startAt: startAt.toDMSTime(),
            endDayOfWeek: endDayOfWeek,
            endAt: endAt.toDMSTime()
        )
    }
}
