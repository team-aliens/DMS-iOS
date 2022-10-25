import DataMappingModule
import DomainModule

public extension DmsFeaturesResponseDTO {
    func toDomain() -> DmsFeatures {
        DmsFeatures(
            mealService: features.mealService,
            noticeService: features.noticeService,
            pointService: features.pointService
        )
    }
}
