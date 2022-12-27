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
        } onReceiveError: { error in
            print(error)
        }
    }

    func fetchStudyAvailableTime() {
        addCancellable(
            fetchStudyAvailableTimeUseCase.execute()
        ) { [weak self] studyAvailableTime  in
            self?.studyAvailableTime = studyAvailableTime
        } onReceiveError: { error in
            print(error)
        }
    }

    var rangeString: String {
        if let time = studyAvailableTime {
            var text = "자습실 신청 시간은 " + time.startAt.toHourAndMinuteDSMDateString() +
            " ~ " + time.endAt.toHourAndMinuteDSMDateString() + " 까지 입니다."
            return text
        } else {
            return ""
        }
    }
}
