import Foundation

public struct RemainsAvailableTimeEntity: Equatable, Hashable {
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
}
