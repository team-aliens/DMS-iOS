import Foundation
import DataMappingModule

public struct RemainsAvailableTimeEntity: Equatable, Hashable {
    public init(
        startDayOfWeek: WeekType,
        startAt: Date,
        endDayOfWeek: WeekType,
        endAt: Date
    ) {
        self.startDayOfWeek = startDayOfWeek
        self.startAt = startAt
        self.endDayOfWeek = endDayOfWeek
        self.endAt = endAt
    }

    public let startDayOfWeek: WeekType
    public let startAt: Date
    public let endDayOfWeek: WeekType
    public let endAt: Date
}
