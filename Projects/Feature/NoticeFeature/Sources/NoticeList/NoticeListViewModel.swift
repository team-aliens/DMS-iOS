import NoticeDomainInterface

final class NoticeListViewModel: BaseViewModel {
    @Published var noticeList: [NoticeEntity] = []
    @Published var noticeOrderType: NoticeOrderType = .new

    private let fetchNoticeListUseCase: any FetchNoticeListUseCase

    init(
        fetchNoticeListUseCase: any FetchNoticeListUseCase
    ) {
        self.fetchNoticeListUseCase = fetchNoticeListUseCase
    }

    func onAppear() {
        addCancellable(
            fetchNoticeListUseCase.execute(
                order: noticeOrderType
            )
        ) { [weak self]  noticeList in
            self?.noticeList = noticeList
        }
    }

    func orderTypeButtonDidTap() {
        self.noticeOrderType = noticeOrderType == .new ? .old : .new
        onAppear()
    }

    func refresh() {
        addCancellable(
            fetchNoticeListUseCase.execute(
                order: noticeOrderType
            )
        ) { [weak self]  noticeList in
            self?.noticeList = noticeList
        }
    }
}
