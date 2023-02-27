import Foundation

public struct FetchRemainsAvailableTimeResponseDTO: Decodable {
    public init(
        startDayOfWeek: WeekType,
        startAt: String,
        endDayOfWeek: WeekType,
        endAt: String
    ) {
        self.startDayOfWeek = startDayOfWeek
        self.startAt = startAt
        self.endDayOfWeek = endDayOfWeek
        self.endAt = endAt
    }

    public let startDayOfWeek: WeekType
    public let startAt: String
    public let endDayOfWeek: WeekType
    public let endAt: String

    enum CodingKeys: String, CodingKey {
        case startDayOfWeek = "start_day_of_week"
        case startAt = "start_time"
        case endDayOfWeek = "end_day_of_week"
        case endAt = "end_time"
    }
}
