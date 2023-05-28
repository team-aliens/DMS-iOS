import Foundation

public extension SigninResponseDTO {
    func toDomain() -> SigninDmsFeatures {
        SigninDmsFeatures(
            mealService: mealService,
            noticeService: noticeService,
            pointService: pointService,
            studyRoomService: studyRoomService,
            remainService: remainService
        )
    }
}
