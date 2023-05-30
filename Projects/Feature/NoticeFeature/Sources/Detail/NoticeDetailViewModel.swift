import BaseFeature
import UIKit
import Combine
import NoticeDomainInterface
import UtilityModule

final class NoticeDetailViewModel: BaseViewModel {
    @Published var title = ""
    @Published var content = ""
    @Published var date = Date()
    var displayDate: String {
        "\(date.toDMSNoticeTimeString())"
    }

    private let id: String

    private let fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase

    init(
        fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase,
        id: String
    ) {
        self.fetchDetailNoticeUseCase = fetchDetailNoticeUseCase
        self.id = id
    }

    func onAppear() {
        addCancellable(
            fetchDetailNoticeUseCase.execute(id: id)
        ) { [weak self] noticeDetail in
            self?.title = noticeDetail.title
            self?.content = noticeDetail.content
            self?.date = noticeDetail.createdAt.toSmallDMSDate()
        }
    }
}
