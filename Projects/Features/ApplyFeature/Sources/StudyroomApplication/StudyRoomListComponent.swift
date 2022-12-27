import DesignSystem
import DomainModule
import SwiftUI
import NeedleFoundation

public protocol StudyRoomListDependency: Dependency {
    var fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase { get }
    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase { get }
}

public final class StudyRoomListComponent: Component<StudyRoomListDependency> {
    public func makeView() -> some View {
        StudyRoomListView(
            viewModel: .init(
                fetchStudyRoomListUseCase: dependency.fetchStudyRoomListUseCase,
                fetchStudyAvailableTimeUseCase: dependency.fetchStudyAvailableTimeUseCase
            )
        )
    }
}
