import Foundation
import WatchRestAPIModule

final class DetailNoticeIntent: DetailNoticeIntentProtocol {
    private let noticeRepository: any NoticeRepository
    private weak var model: (any DetailNoticeActionProtocol)?
    private let noticeID: String

    init(
        model: any DetailNoticeActionProtocol,
        noticeRepository: any NoticeRepository,
        noticeID: String
    ) {
        self.model = model
        self.noticeRepository = noticeRepository
        self.noticeID = noticeID
        self.initialize()
    }

    func initialize() {
        model?.updateIsLoading(isLoading: true)
        Task {
            do {
                let notice = try await noticeRepository.fetchDetailNotice(id: noticeID)
                model?.updateDetailNotice(notice: notice)
            } catch {
                model?.updateIsError(isError: true)
            }
            model?.updateIsLoading(isLoading: false)
        }
    }
}
