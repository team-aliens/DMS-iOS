import Foundation

public struct FetchRemainsAvailableTimeResponseDTO: Decodable {
    public init(
        startDayOfWeek: WeekType,
        startTime: String,
        endDayOfWeek: WeekType,
        endTime: String
    ) {
        self.startDayOfWeek = startDayOfWeek
        self.startTime = startTime
        self.endDayOfWeek = endDayOfWeek
        self.endTime = endTime
    }

    public let startDayOfWeek: WeekType
    public let startTime: String
    public let endDayOfWeek: WeekType
    public let endTime: String

    enum CodingKeys: String, CodingKey {
        case startDayOfWeek = "start_day_of_week"
        case startTime = "start_time"
        case endDayOfWeek = "end_day_of_week"
        case endTime = "end_time"
    }
}
