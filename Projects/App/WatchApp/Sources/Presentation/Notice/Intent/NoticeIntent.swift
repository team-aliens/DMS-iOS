import Foundation
import WatchRestAPIModule

final class NoticeIntent: NoticeIntentProtocol {
    private let noticeRepository: any NoticeRepository
    private weak var model: (any NoticeActionProtocol)?

    init(
        model: any NoticeActionProtocol,
        noticeRepository: any NoticeRepository
    ) {
        self.model = model
        self.noticeRepository = noticeRepository
    }

    func onAppear() {
        model?.updateIsLoading(isLoading: true)
        Task {
            do {
                let noticeList = try await noticeRepository.fetchNoticeList(order: .new)
                model?.updateNoticeList(noticeList: noticeList)
            } catch {
                model?.updateIsError(isError: true)
            }
            model?.updateIsLoading(isLoading: false)
        }
    }
}
