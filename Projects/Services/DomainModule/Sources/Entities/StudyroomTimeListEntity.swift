import Foundation

public struct StudyroomTimeListEntity: Equatable, Hashable {
    public init(
        timeSlots: [TimeSlotsEntity]
    ) {
        self.timeSlots = timeSlots
    }

    public let timeSlots: [TimeSlotsEntity]
}
