import BaseFeature
import DomainModule
import DataMappingModule
import Combine
import SwiftUI

final class RemainApplyViewModel: BaseViewModel {

    @Published var isShowingToast = false
    @Published var toastMessage = ""

    @Published var remainsAvailableTime: RemainsAvailableTimeEntity?
    @Published var remainApplicationList = RemainApplicationListEntity(remainOptions: [])
    @Published var myRemainsApplicationItems: MyRemainApplicationItemsEntity?

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

    func remainingApplicationsChanges(id: String) {
        addCancellable(
            remainingApplicationsChangesUseCase.execute(id: id),
            onReceiveValue: {

            }
        )
    }

    func fetchMyRemainApplicationItems() {
        addCancellable(
            fetchMyRemainApplicationItemsUseCase.execute()
        ) { [weak self] myRemainsApplicationItems in
            self?.myRemainsApplicationItems = myRemainsApplicationItems
        }
    }
}
