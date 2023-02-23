import Combine

public final class StayStateModel: ObservableObject {
    public init() {}
    @Published public var selectedNum: Int = 3
    @Published public var selectedType: String = ""
    @Published public var isAlreadyApplied: Bool = false
    @Published public var appliedState: String? = ""
    @Published public var appliedStateNum: Int = 3
    @Published public var isDetailTapped: Bool = false
}
