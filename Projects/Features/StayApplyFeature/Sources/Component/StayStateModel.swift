import Combine

public final class StayStateModel: ObservableObject {
    public init() {}
    @Published public var currentSelectedNum: Int = 0
    @Published public var currentSelectedType: String = ""
    @Published public var isAlreadyApplied: Bool = false
}
