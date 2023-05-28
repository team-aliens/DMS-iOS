import Foundation

public struct SignupDmsFeatures: Equatable {
    public init(
        mealService: Bool,
        noticeService: Bool,
        pointService: Bool,
        studyRoomService: Bool,
        remainService: Bool
    ) {
        self.mealService = mealService
        self.noticeService = noticeService
        self.pointService = pointService
        self.studyRoomService = studyRoomService
        self.remainService = remainService
    }

    public init() {
        self.mealService = false
        self.noticeService = false
        self.pointService = false
        self.studyRoomService = false
        self.remainService = false
    }

    public let mealService: Bool
    public let noticeService: Bool
    public let pointService: Bool
    public let studyRoomService: Bool
    public let remainService: Bool
}
