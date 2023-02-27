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
    @Published var isDetailTapped: Bool = false

    @Published var isApplicationTime = true
    @Published var isShowingToast = false
    @Published var toastMessage = "잔류 신청 시간이 아닙니다."

    @Published var remainsAvailableTime: RemainsAvailableTimeEntity?

    var rangeString: String {
        if let time = remainsAvailableTime {
            let text = "잔류 신청 시간은 " + time.startDayOfWeek.rawValue + " " + time.startAt.toSmallDMSTimeString() +
            " ~ " + time.endDayOfWeek.rawValue + time.endAt.toSmallDMSTimeString() + " 까지 입니다."
            return text
        } else {
            return "null"
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
}
