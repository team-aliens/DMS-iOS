import Foundation

public struct DmsFeatures: Equatable {
    public init(
        mealService: Bool,
        noticeService: Bool,
        pointService: Bool
    ) {
        self.mealService = mealService
        self.noticeService = noticeService
        self.pointService = pointService
    }

    public let mealService: Bool
    public let noticeService: Bool
    public let pointService: Bool
}
