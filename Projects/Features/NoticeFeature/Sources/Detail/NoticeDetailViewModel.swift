import BaseFeature
import UIKit
import Combine
import DomainModule

final class NoticeDetailViewModel: BaseViewModel {
    @Published var title = ""
    @Published var content = ""
    @Published var date = Date()
    var displayDate: String {
        "\(date.year)/\(date.month)/\(date.day) \(date.hour):\(date.minute)"
    }

    private let id: String

    private let fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase

    init(
        fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase,
        id: String
    ) {
        self.fetchDetailNoticeUseCase = fetchDetailNoticeUseCase
        self.id = id
        super.init()

        addCancellable(
            fetchDetailNoticeUseCase.execute(id: id)
        ) { [weak self] noticeDetail in
            self?.title = noticeDetail.title
            self?.content = "asdasf\nasda"
            self?.date = noticeDetail.createdAt
        }
    }
}
