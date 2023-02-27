import Foundation

public struct FetchRemainsAvailableTimeResponseDTO: Decodable {
    public init(
        startDayOfWeek: WeekType,
        startTime: Date,
        endDayOfWeek: WeekType,
        endTime: Date
    ) {
        self.startDayOfWeek = startDayOfWeek
        self.startTime = startTime
        self.endDayOfWeek = endDayOfWeek
        self.endTime = endTime
    }

    public let startDayOfWeek: WeekType
    public let startTime: Date
    public let endDayOfWeek: WeekType
    public let endTime: Date

    enum CodingKeys: String, CodingKey {
        case startDayOfWeek = "start_day_of_week"
        case startTime = "start_time"
        case endDayOfWeek = "end_day_of_week"
        case endTime = "end_time"
    }
}
