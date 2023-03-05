import Foundation

public struct DmsFeaturesResponseDTO: Decodable {
    public let features: DmsFeaturesDTO
}

public struct DmsFeaturesDTO: Decodable {
    public let studyRoomService: Bool
    public let remainService: Bool

    enum CodingKeys: String, CodingKey {
        case studyRoomService = "study_room_service"
        case remainService = "remain_service"
    }
}
