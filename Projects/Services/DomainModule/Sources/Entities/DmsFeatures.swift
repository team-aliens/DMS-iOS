import Foundation

public struct DmsFeatures: Equatable {
    public init(
        studyRoomService: Bool,
        remainService: Bool
    ) {
        self.studyRoomService = studyRoomService
        self.remainService = remainService
    }

    public init() {
        self.studyRoomService = false
        self.remainService = false
    }

    public let studyRoomService: Bool
    public let remainService: Bool
}
