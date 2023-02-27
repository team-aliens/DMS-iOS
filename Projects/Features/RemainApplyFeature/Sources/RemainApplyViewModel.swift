import BaseFeature
import DomainModule
import DataMappingModule
import Combine
import SwiftUI

final class RemainApplyViewModel: BaseViewModel {
    @Published var selectedNum: Int = 10
    @Published var selectedType: String = ""
    @AppStorage("isApplied") var isAlreadyApplied: Bool = false
    @Published var appliedState: String = ""
    @AppStorage("appliedNum") var appliedNum: Int = 10

    @Published var isApplicationTime = true
    @Published var isShowingToast = false
    @Published var toastMessage = ""

    @Published var remainsAvailableTime: RemainsAvailableTimeEntity?
    @Published var remainApplicationList = RemainApplicationListEntity(remainOptions: [])
    @Published var selectedRemainOptionEntity: SelectedRemainOptionEntity?
    // 이부분에 옵셔널 처리가 아닌 값처리를 해주면 값이 잘 바껴요
//    @Published var selectedEntity: RemainOptionEntity?

    var rangeString: String {
        if let time = remainsAvailableTime {
            let startString = "\(time.startDayOfWeek.displayString()) \(time.startTime.toSmallDMSTimeString())"
            let endString = "\(time.endDayOfWeek.displayString()) \(time.endTime.toSmallDMSTimeString())"
            let text = "잔류 신청 시간은 \(startString) ~ \(endString) 까지 입니다."
            return text
        } else {
            return ""
        }
    }

    private let fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase
    private let fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase
    private let fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase
    private let remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase

    public init(
        fetchMyRemainApplicationItemsUseCase: any FetchMyRemainApplicationItemsUseCase,
        fetchRemainApplicationListUseCase: any FetchRemainApplicationListUseCase,
        fetchRemainsAvailableTimeUseCase: any FetchRemainsAvailableTimeUseCase,
        remainingApplicationsChangesUseCase: any RemainingApplicationsChangesUseCase
    ) {
        self.fetchMyRemainApplicationItemsUseCase = fetchMyRemainApplicationItemsUseCase
        self.fetchRemainApplicationListUseCase = fetchRemainApplicationListUseCase
        self.fetchRemainsAvailableTimeUseCase = fetchRemainsAvailableTimeUseCase
        self.remainingApplicationsChangesUseCase = remainingApplicationsChangesUseCase
    }

    func fetchRemainsAvailableTime() {
        addCancellable(
            fetchRemainsAvailableTimeUseCase.execute()
        ) { [weak self] remainsAvailableTime  in
            self?.remainsAvailableTime = remainsAvailableTime
        }
    }

    func fetchRemainApplicationList() {
        addCancellable(
            fetchRemainApplicationListUseCase.execute()
        ) { [weak self] remainApplicationList in
            self?.remainApplicationList = remainApplicationList
        }
    }
}
