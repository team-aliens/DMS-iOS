import DataMappingModule
import DomainModule

public extension DmsFeaturesResponseDTO {
    func toDomain() -> DmsFeatures {
        DmsFeatures(
            studyRoomService: features.studyRoomService,
            remainService: features.remainService
        )
    }
}
