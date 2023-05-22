import Foundation
import DataMappingModule

public struct RemainsAvailableTimeEntity: Equatable, Hashable {
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
}
