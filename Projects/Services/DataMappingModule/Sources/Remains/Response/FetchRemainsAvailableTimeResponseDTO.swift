import Foundation

public struct FetchRemainsAvailableTimeResponseDTO: Decodable {
    public init(
        startDayOfWeek: String,
        startAt: String,
        endDayOfWeek: String,
        endAt: String
    ) {
        self.startDayOfWeek = startDayOfWeek
        self.startAt = startAt
        self.endDayOfWeek = endDayOfWeek
        self.endAt = endAt
    }
    public let startDayOfWeek: String
    public let startAt: String
    public let endDayOfWeek: String
    public let endAt: String
    enum CodingKeys: String, CodingKey {
        case startDayOfWeek = "start_day_of_week"
        case startAt = "start_at"
        case endDayOfWeek = "end_day_of_week"
        case endAt = "end_at"
    }
}
