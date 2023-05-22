import Foundation

public struct DmsFeaturesResponseDTO: Decodable {
    public let features: DmsFeaturesDTO
}

public struct DmsFeaturesDTO: Decodable {
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
