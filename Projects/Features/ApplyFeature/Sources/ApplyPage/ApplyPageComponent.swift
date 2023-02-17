import SwiftUI
import StudyRoomFeature
import StayApplyFeature
import NeedleFoundation

public protocol ApplyPageDependency: Dependency {
    var studyRoomListComponent: StudyRoomListComponent { get }
    var stayApplyComponent: StayApplyComponent { get }
}

public final class ApplyPageComponent: Component<ApplyPageDependency> {
    public func makeView() -> some View {
        ApplyPageView(
            viewModel: ApplyPageViewModel(),
            studyRoomListComponent: dependency.studyRoomListComponent,
            stayApplyComponent: dependency.stayApplyComponent
        )
    }
}
