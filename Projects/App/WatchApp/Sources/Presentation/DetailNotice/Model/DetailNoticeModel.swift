import Foundation
import WatchRestAPIModule

final class DetailNoticeModel: ObservableObject, DetailNoticeStateProtocol {
    @Published var notice: DetailNoticeEntity?
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
}

extension DetailNoticeModel: DetailNoticeActionProtocol {
    func updateDetailNotice(notice: DetailNoticeEntity?) {
        self.notice = notice
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }

    func updateIsError(isError: Bool) {
        self.isError = isError
    }
}
