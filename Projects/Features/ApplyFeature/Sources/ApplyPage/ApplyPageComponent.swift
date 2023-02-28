import SwiftUI
import StudyRoomFeature
import RemainApplyFeature
import NeedleFoundation
import DomainModule

public protocol ApplyPageDependency: Dependency {
    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase { get }
    var fetchMyStudyRoomAppItemsUserCase: any FetchMyStudyRoomAppItemsUserCase { get }
    var studyRoomListComponent: StudyRoomListComponent { get }
    var remainApplyComponent: RemainApplyComponent { get }
}

public final class ApplyPageComponent: Component<ApplyPageDependency> {
    public func makeView() -> some View {
        ApplyPageView(
            viewModel: .init(
                fetchMyRemainApplicationItemsUseCase: dependency.fetchMyRemainApplicationItemsUseCase,
                fehtchMyStudyRoomApplicationItemsUserCase: dependency.fetchMyStudyRoomAppItemsUserCase
            ),
            studyRoomListComponent: dependency.studyRoomListComponent,
            remainApplyComponent: dependency.remainApplyComponent
        )
    }
}
