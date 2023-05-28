import Foundation

public struct SignupResponseDTO: Codable {
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

    enum CodingKeys: String, CodingKey {
        case mealService = "meal_service"
        case noticeService = "notice_service"
        case pointService = "point_service"
        case studyRoomService = "study_room_service"
        case remainService = "remain_service"
    }
}
