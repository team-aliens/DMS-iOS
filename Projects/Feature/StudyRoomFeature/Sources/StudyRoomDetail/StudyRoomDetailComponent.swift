import SwiftUI
import StudyRoomsDomainInterface
import StudyRoomFeatureInterface
import NeedleFoundation

public protocol StudyRoomDetailDependency: Dependency {
    var fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase { get }
    var fetchSeatTypesUseCase: any FetchSeatTypesUseCase { get }
    var fetchDetailStudyRoomUseCase: any FetchDetailStudyRoomUseCase { get }
    var applyStudyRoomSeatUseCase: any ApplyStudyRoomSeatUseCase { get }
    var cancelStudyRoomSeatUseCase: any CancelStudyRoomSeatUseCase { get }

}

public final class StudyRoomDetailComponent: Component<StudyRoomDetailDependency>, StudyRoomDetailFactory {
    public func makeView(studyRoomParam: StudyRoomParam, timeSlot: String) -> some View {
        StudyRoomDetailView(
            viewModel: .init(
                studyRoomEntity: studyRoomParam.toEntity(),
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

extension StudyRoomParam {
    func toEntity() -> StudyRoomEntity {
        StudyRoomEntity(
            id: id,
            floor: floor,
            name: name,
            availableGrade: availableGrade,
            availableSex: AvailableSexType(rawValue: availableSex) ?? .all,
            inUseHeadcount: inUseHeadcount,
            totalAvailableSeat: totalAvailableSeat,
            isMine: isMine
        )
    }
}
