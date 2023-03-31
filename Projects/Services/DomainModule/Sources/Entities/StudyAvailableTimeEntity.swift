import Foundation

public struct StudyAvailableTimeEntity: Equatable {
    public init(startAt: String, endAt: String) {
        self.startAt = startAt
        self.endAt = endAt
    }

    public let startAt: String
    public let endAt: String
}
