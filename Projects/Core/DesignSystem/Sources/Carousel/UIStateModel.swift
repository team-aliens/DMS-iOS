import Combine

public final class UIStateModel: ObservableObject {
    public init() {}
    @Published public var activeCard: Int = 0
    @Published public var screenDrag: Float = 0.0
}
