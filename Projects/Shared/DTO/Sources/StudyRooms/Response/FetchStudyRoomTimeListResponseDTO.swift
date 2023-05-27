import Foundation

public struct FetchStudyRoomTimeListResponseDTO: Decodable {
    public init(timeSlots: [TimeSlotsResponseDTO]) {
        self.timeSlots = timeSlots
    }

    public let timeSlots: [TimeSlotsResponseDTO]

    enum CodingKeys: String, CodingKey {
        case timeSlots = "time_slots"
    }
}
