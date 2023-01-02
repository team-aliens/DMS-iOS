import Foundation

public struct DmsFeatures: Equatable {
    public init(
        studyRoomService: Bool
    ) {
        self.studyRoomService = studyRoomService
    }

    public init() {
        self.studyRoomService = false
    }

    public let studyRoomService: Bool
}
