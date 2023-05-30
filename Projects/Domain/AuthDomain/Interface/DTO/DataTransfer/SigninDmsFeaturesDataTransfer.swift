import Foundation

public extension SigninDmsFeaturesResponseDTO {
    func toDomain() -> SigninDmsFeatures {
        SigninDmsFeatures(
            mealService: features.mealService,
            noticeService: features.noticeService,
            pointService: features.pointService,
            studyRoomService: features.studyRoomService,
            remainService: features.remainService
        )
    }
}
