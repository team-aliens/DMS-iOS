import DataMappingModule
import DomainModule

public extension FetchStudyRoomTimeListResponseDTO {
    func toDomain() -> StudyroomTimeListEntity {
        StudyroomTimeListEntity(
            timeSlots: timeSlots.map { $0.toDomain() }
        )
    }
}

public extension TimeSlotsResponseDTO {
    func toDomain() -> TimeSlotsEntity {
        TimeSlotsEntity(
            id: id,
            startTime: startTime,
            endTime: endTime
        )
    }
}
