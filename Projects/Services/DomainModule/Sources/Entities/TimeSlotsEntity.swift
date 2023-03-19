import Foundation

public struct TimeSlotsEntity: Equatable, Hashable {
    public init(
        id: String,
        startTime: String,
        endTime: String
    ) {
        self.id = id
        self.startTime = startTime
        self.endTime = endTime
    }

    public let id: String
    public let startTime: String
    public let endTime: String
}
