import Combine

public final class StudyRoomStateModel: ObservableObject {
    public init() {}
    @Published public var appliedState: String? = ""
}
