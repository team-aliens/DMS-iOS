import Foundation

public struct DmsFeaturesResponseDTO: Decodable {
    public let features: DmsFeaturesDTO
}

public struct DmsFeaturesDTO: Decodable {
    public let studyRoomService: Bool

    enum CodingKeys: String, CodingKey {
        case studyRoomService = "study_room_service"
    }
}
