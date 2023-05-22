import DataMappingModule
import DomainModule
import Utility

public extension FetchStudyAvailableTimeResponseDTO {
    func toDomain() -> StudyAvailableTimeEntity {
        StudyAvailableTimeEntity(
            startAt: startAt,
            endAt: endAt
        )
    }
}
