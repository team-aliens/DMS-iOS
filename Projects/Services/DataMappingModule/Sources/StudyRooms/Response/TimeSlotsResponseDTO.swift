import Foundation

public struct TimeSlotsResponseDTO: Decodable {
    public init(
        id: String,
        startTime: String,
        endTime: String
    ) {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
    }

    public let id: String
    public let startTime: String
    public let endTime: String

    enum CodingKeys: String, CodingKey {
        case id
        case startTime = "start_time"
        case endTime = "end_time"
    }
}
