import Foundation

public struct SignupResponseDTO: Decodable {
    public let isFeaturesOn: IsFeaturesOn

    public init(
        isFeaturesOn: IsFeaturesOn
    ) {
        self.isFeaturesOn = isFeaturesOn
    }
}

public struct IsFeaturesOn: Decodable {
    public let meal: Bool
    public let notice: Bool
    public let point: Bool
    public let studyRoom: Bool
    public let remain: Bool

    enum CodingKeys: String, CodingKey {
        case meal = "meal_service"
        case notice = "notice_service"
        case point = "point_service"
        case studyRoom = "study_room_service"
        case remain = "remain_service"
    }
}
