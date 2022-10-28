import Combine

public final class SceneFlowState: ObservableObject {
    @Published public var sceneFlow: SceneFlow

    public init(sceneFlow: SceneFlow) {
        self.sceneFlow = sceneFlow
    }
}
