import DomainModule
import Foundation
import Utility

public final class AppState: ObservableObject {
    public init(sceneFlow: SceneFlow, features: DmsFeatures) {
        self.sceneFlow = sceneFlow
        self.features = features
    }

    @Published public var sceneFlow: SceneFlow
    @Published public var features: DmsFeatures
}
