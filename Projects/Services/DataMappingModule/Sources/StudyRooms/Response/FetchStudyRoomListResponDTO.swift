import Foundation

public struct FetchStudyRoomListResponDTO: Decodable {
    public init(studyRooms: [SingleStudyRoomResponseDTO]) {
        self.studyRooms = studyRooms
    }

    public let studyRooms: [SingleStudyRoomResponseDTO]

    enum CodingKeys: String, CodingKey {
        case studyRooms = "study_rooms"
    }
}
