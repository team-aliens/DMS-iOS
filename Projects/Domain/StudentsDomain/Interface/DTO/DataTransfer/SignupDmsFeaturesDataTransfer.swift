import Combine

public extension SignupDmsFeaturesResponseDTO {
    func toDomain() -> SignupDmsFeatures {
        SignupDmsFeatures(
            mealService: features.mealService,
            noticeService: features.noticeService,
            pointService: features.pointService,
            studyRoomService: features.studyRoomService,
            remainService: features.remainService
        )
    }
}
