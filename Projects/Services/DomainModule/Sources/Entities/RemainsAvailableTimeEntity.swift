import Foundation
import DataMappingModule

public struct RemainsAvailableTimeEntity: Equatable, Hashable {
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
}
