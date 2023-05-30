import DesignSystem
import StudyRoomsDomainInterface
import SwiftUI
import NeedleFoundation
import StudyRoomFeatureInterface

public protocol StudyRoomListDependency: Dependency {
    var fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase { get }
    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase { get }
    var fetchStudyroomTimeListUseCase: any FetchStudyroomTimeListUseCase { get }
    var studyRoomDetailComponent: StudyRoomDetailComponent { get }
}

public final class StudyRoomListComponent: Component<StudyRoomListDependency>, StudyRoomListFactory {
    public func makeView() -> some View {
        StudyRoomListView(
            viewModel: .init(
                fetchStudyRoomListUseCase: dependency.fetchStudyRoomListUseCase,
                fetchStudyAvailableTimeUseCase: dependency.fetchStudyAvailableTimeUseCase,
                fetchStudyroomTimeListUseCase: dependency.fetchStudyroomTimeListUseCase
            ),
            studyRoomDetailComponent: dependency.studyRoomDetailComponent
        )
    }
}
