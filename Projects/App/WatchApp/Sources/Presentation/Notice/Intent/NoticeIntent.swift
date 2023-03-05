import Foundation
import WatchRestAPIModule

final class NoticeIntent: NoticeIntentProtocol {
    private let noticeRepository: any NoticeRepository
    private weak var model: (any NoticeActionProtocol)?
    private let watchSessionManager: WatchSessionManager

    init(
        model: any NoticeActionProtocol,
        noticeRepository: any NoticeRepository,
        watchSessionManager: WatchSessionManager
    ) {
        self.model = model
        self.noticeRepository = noticeRepository
        self.watchSessionManager = watchSessionManager
    }

    func onAppear() {
        model?.updateIsLoading(isLoading: true)
        Task {
            do {
                let noticeList = try await noticeRepository.fetchNoticeList(order: .new)
                model?.updateNoticeList(noticeList: noticeList)
            } catch {
                model?.updateIsError(isError: true)
                watchSessionManager.refresh { [weak self] in
                    guard let self else { return }
                    self.refresh()
                }
            }
            model?.updateIsLoading(isLoading: false)
        }
    }

    func refresh() {
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
