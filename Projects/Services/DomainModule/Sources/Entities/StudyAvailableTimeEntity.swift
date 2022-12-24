import Foundation

public struct StudyAvailableTimeEntity: Equatable {
    public init(startAt: Date, endAt: Date) {
        self.startAt = startAt
        self.endAt = endAt
    }

    public let startAt: Date
    public let endAt: Date
}
