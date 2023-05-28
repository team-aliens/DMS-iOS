import Combine

public extension SignupResponseDTO {
    func toDomain() -> SignupDmsFeatures {
        SignupDmsFeatures(
            mealService: mealService,
            noticeService: noticeService,
            pointService: pointService,
            studyRoomService: studyRoomService,
            remainService: remainService
        )
    }
}
