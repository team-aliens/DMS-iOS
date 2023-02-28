import SwiftUI
import StudyRoomFeature
import RemainApplyFeature
import NeedleFoundation

public protocol ApplyPageDependency: Dependency {
    var studyRoomListComponent: StudyRoomListComponent { get }
    var remainApplyComponent: RemainApplyComponent { get }
}

public final class ApplyPageComponent: Component<ApplyPageDependency> {
    public func makeView() -> some View {
        ApplyPageView(
            viewModel: ApplyPageViewModel(),
            studyRoomListComponent: dependency.studyRoomListComponent,
            remainApplyComponent: dependency.remainApplyComponent
        )
    }
}
