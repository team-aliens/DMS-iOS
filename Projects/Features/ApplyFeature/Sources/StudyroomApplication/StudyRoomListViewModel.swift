import BaseFeature
import Foundation
import DomainModule
import ErrorModule
import Combine
import DataMappingModule

final class StudyRoomListViewModel: BaseViewModel {
    @Published var studyRoomList: [StudyRoomEntity] = []
    @Published var isStudyRoomTime = true
    @Published var isShowingToast = false
    @Published var toastMessage = ""
    @Published var studyAvailableTime: StudyAvailableTimeEntity?
    @Published var isNavigateDetail: Bool = false
    @Published var studyRoomDetail: StudyRoomEntity = .init(
        id: "",
        floor: 0,
        name: "",
        availableGrade: 0,
        availableSex: .all,
        inUseHeadcount: 0,
        totalAvailableSeat: 0,
        isMine: false
    )

    var rangeString: String {
        if let time = studyAvailableTime {
            let text = "자습실 신청 시간은 " + time.startAt.toHourAndMinuteDSMDateString() +
            " ~ " + time.endAt.toHourAndMinuteDSMDateString() + " 까지 입니다."
            return text
        } else {
            return ""
        }
    }

    private let fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase
    private let fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase

    public init(
        fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase,
        fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase
    ) {
        self.fetchStudyRoomListUseCase = fetchStudyRoomListUseCase
        self.fetchStudyAvailableTimeUseCase = fetchStudyAvailableTimeUseCase
        super.init()
    }

    func fetchStudyRoomList() {
        addCancellable(
            fetchStudyRoomListUseCase.execute()
        ) { [weak self]  studyRoomList in
            self?.studyRoomList = studyRoomList
        }
    }

    func fetchStudyAvailableTime() {
        addCancellable(
            fetchStudyAvailableTimeUseCase.execute()
        ) { [weak self] studyAvailableTime  in
            self?.studyAvailableTime = studyAvailableTime
        }
    }
}
