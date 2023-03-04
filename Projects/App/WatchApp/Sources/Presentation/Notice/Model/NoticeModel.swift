import Foundation
import WatchRestAPIModule

final class NoticeModel: ObservableObject, NoticeStateProtocol {
    @Published var noticeList: [NoticeEntity] = []
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
}

extension NoticeModel: NoticeActionProtocol {
    func updateNoticeList(noticeList: [NoticeEntity]) {
        self.noticeList = noticeList
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }

    func updateIsError(isError: Bool) {
        self.isError = isError
    }
}
