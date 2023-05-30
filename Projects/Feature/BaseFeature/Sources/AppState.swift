import Combine
import Foundation

public final class AppState: ObservableObject {
    public init(sceneFlow: SceneFlow, features: DmsFeatures) {
        self.sceneFlow = sceneFlow
        self.features = features
    }

    @Published public var sceneFlow: SceneFlow
    @Published public var features: DmsFeatures
}

public struct DmsFeatures: Equatable {
    public init(
        mealService: Bool,
        noticeService: Bool,
        pointService: Bool,
        studyRoomService: Bool,
        remainService: Bool
    ) {
        self.mealService = mealService
        self.noticeService = noticeService
        self.pointService = pointService
        self.studyRoomService = studyRoomService
        self.remainService = remainService
    }

    public init() {
        self.mealService = false
        self.noticeService = false
        self.pointService = false
        self.studyRoomService = false
        self.remainService = false
    }

    public var mealService: Bool
    public var noticeService: Bool
    public var pointService: Bool
    public var studyRoomService: Bool
    public var remainService: Bool
}
