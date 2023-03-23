import SwiftUI
import DomainModule
import NeedleFoundation

public protocol StudyRoomDetailDependency: Dependency {
    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase { get }
    var fetchSeatTypesUseCase: any FetchSeatTypesUseCase { get }
    var fetchDetailStudyRoomUseCase: any FetchDetailStudyRoomUseCase { get }
    var applyStudyRoomSeatUseCase: any ApplyStudyRoomSeatUseCase { get }
    var cancelStudyRoomSeatUseCase: any CancelStudyRoomSeatUseCase { get }

}

public final class StudyRoomDetailComponent: Component<StudyRoomDetailDependency> {
    public func makeView(studyRoomEntity: StudyRoomEntity, timeSlot: String) -> some View {
        StudyRoomDetailView(
            viewModel: .init(
                studyRoomEntity: studyRoomEntity,
                timeSlotParam: timeSlot,
                fetchStudyAvailableTimeUseCase: dependency.fetchStudyAvailableTimeUseCase,
                fetchSeatTypesUseCase: dependency.fetchSeatTypesUseCase,
                fetchDetailStudyRoomUseCase: dependency.fetchDetailStudyRoomUseCase,
                applyStudyRoomSeatUseCase: dependency.applyStudyRoomSeatUseCase,
                cancelStudyRoomSeatUseCase: dependency.cancelStudyRoomSeatUseCase
            )
        )
    }
}
