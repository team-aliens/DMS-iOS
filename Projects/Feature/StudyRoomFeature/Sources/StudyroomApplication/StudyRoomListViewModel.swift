import BaseFeature
import Foundation
import DomainModule
import ErrorModule
import Combine
import DataMappingModule

final class StudyRoomListViewModel: BaseViewModel {
    @Published var studyRoomList: [StudyRoomEntity] = []
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    @Published var isNavigateDetail: Bool = false
    @Published var isStudyTimeBottomSheet: Bool = false
    @Published var isOnLoad: Bool = false

    @Published var studyroomTimeList = StudyroomTimeListEntity(timeSlots: [])
    @Published var selectedTimeEntity: TimeSlotsEntity?
    @Published var timeSlotParam: String?
    @Published var studyAvailableTime: StudyAvailableTimeEntity?
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
            let text = "자습실 신청 시간은 " + time.startAt +
            " ~ " + time.endAt + " 까지 입니다."
            return text
        } else {
            return ""
        }
    }

    private let fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase
    private let fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase
    private let fetchStudyroomTimeListUseCase: any FetchStudyroomTimeListUseCase

    public init(
        fetchStudyRoomListUseCase: any FetchStudyRoomListUseCase,
        fetchStudyAvailableTimeUseCase: any FetchStudyAvailableTimeUseCase,
        fetchStudyroomTimeListUseCase: any FetchStudyroomTimeListUseCase
    ) {
        self.fetchStudyRoomListUseCase = fetchStudyRoomListUseCase
        self.fetchStudyAvailableTimeUseCase = fetchStudyAvailableTimeUseCase
        self.fetchStudyroomTimeListUseCase = fetchStudyroomTimeListUseCase
    }

    private func fetchStudyRoomList() {
        addCancellable(
            fetchStudyRoomListUseCase.execute(
                timeSlot: timeSlotParam
            )
        ) { [weak self] studyRoomList in
            self?.studyRoomList = studyRoomList
        }
    }

    private func fetchStudyAvailableTime() {
        addCancellable(
            fetchStudyAvailableTimeUseCase.execute()
        ) { [weak self] studyAvailableTime  in
            self?.studyAvailableTime = studyAvailableTime
        }
    }

    private func fetchStudyroomTimeList() {
        addCancellable(
            fetchStudyroomTimeListUseCase.execute()
        ) { [weak self] studyroomTimeList in
            self?.studyroomTimeList = studyroomTimeList
        }
    }

    func onAppear() {
        if !isOnLoad {
            onLoad()
        } else {
            fetchStudyroomTimeList()
            fetchStudyRoomList()
        }
    }

    func selectStudyRoomTime() {
        self.fetchStudyRoomList()
    }

    private func onLoad() {
        fetchStudyAvailableTime()
        addCancellable(
            fetchStudyroomTimeListUseCase.execute()
        ) { [weak self] studyroomTimeList in
            self?.studyroomTimeList = studyroomTimeList
            self?.selectedTimeEntity = studyroomTimeList.timeSlots.first
            self?.timeSlotParam = studyroomTimeList.timeSlots.first?.id
            self?.fetchStudyRoomList()
        }
        isOnLoad = true
    }
}
