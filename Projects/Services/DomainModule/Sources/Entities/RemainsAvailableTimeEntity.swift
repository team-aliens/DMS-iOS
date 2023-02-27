import Foundation
import DataMappingModule

public struct RemainsAvailableTimeEntity: Equatable, Hashable {
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
}
