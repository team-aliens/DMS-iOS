import DataMappingModule
import DomainModule
import Utility

public extension FetchRemainsAvailableTimeResponseDTO {
    func toDomain() -> RemainsAvailableTimeEntity {
        RemainsAvailableTimeEntity(
            startDayOfWeek: startDayOfWeek,
            startTime: startTime.toDMSTime(),
            endDayOfWeek: endDayOfWeek,
            endTime: endTime.toDMSTime()
        )
    }
}
