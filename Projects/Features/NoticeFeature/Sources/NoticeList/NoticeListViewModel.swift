import BaseFeature
import Foundation
import DomainModule
import ErrorModule
import Combine
import DataMappingModule

final class NoticeListViewModel: BaseViewModel {
    @Published var noticeList: [NoticeEntity] = []
    @Published var noticeOrderType: NoticeOrderType = .new
    @Published var orderTypeButtonName: String = "최신순"

    private let fetchNoticeListUseCase: any FetchNoticeListUseCase

    init(
        fetchNoticeListUseCase: any FetchNoticeListUseCase
    ) {
        self.fetchNoticeListUseCase = fetchNoticeListUseCase
        super.init()
        fetchNoticeList()
    }

    func fetchNoticeList() {
        addCancellable(
            fetchNoticeListUseCase.execute(
                order: noticeOrderType
            )
        ) { [weak self]  noticeList in
            self?.noticeList = noticeList
        }
    }

    func orderTypeButtonDidTap() {
        if noticeOrderType == .new {
            self.noticeOrderType = .old
            self.orderTypeButtonName = "오래된순"
            fetchNoticeList()
        } else if noticeOrderType == .old {
            self.noticeOrderType = .new
            self.orderTypeButtonName = "최신순"
            fetchNoticeList()
        }
    }
}
