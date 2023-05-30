import SwiftUI
import NeedleFoundation
import StudyRoomsDomainInterface
import StudyRoomFeature
import RemainsDomainInterface
import RemainApplyFeature
import ApplyFeatureInterface

public protocol ApplyPageDependency: Dependency {
    var studyRoomListComponent: StudyRoomListComponent { get }
    var remainApplyComponent: RemainApplyComponent { get }
    var fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase { get }
    var fetchMyStudyRoomAppItemsUseCase: any FetchMyStudyRoomAppItemsUseCase { get }
}

public final class ApplyPageComponent: Component<ApplyPageDependency>, ApplyPageFactory {
    public func makeView() -> some View {
        ApplyPageView(
            viewModel: .init(
                fetchMyRemainApplicationItemsUseCase: self.dependency.fetchMyRemainApplicationItemsUseCase,
                fetchMyStudyRoomAppItemsUseCase: self.dependency.fetchMyStudyRoomAppItemsUseCase),
            studyRoomListComponent: dependency.studyRoomListComponent,
            remainApplyComponent: dependency.remainApplyComponent
        )
    }
}
