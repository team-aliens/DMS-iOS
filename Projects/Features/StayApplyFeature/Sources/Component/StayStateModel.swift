import Combine

public final class StayStateModel: ObservableObject {
    public init() {}
    @Published public var currentSelectedNum: Int = 3
    @Published public var currentSelectedType: String = ""
    @Published public var isAlreadyApplied: Bool = false
}
