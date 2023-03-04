import SwiftUI
import WatchRestAPIModule

struct DetailNoticeFactory {
    private let noticeRepository: any NoticeRepository

    init(noticeRepository: any NoticeRepository) {
        self.noticeRepository = noticeRepository
    }

    func makeView(noticeID: String) -> some View {
        let model = DetailNoticeModel()
        let intent = DetailNoticeIntent(
            model: model,
            noticeRepository: noticeRepository,
            noticeID: noticeID
        )
        let container = MVIContainer(
            intent: intent as DetailNoticeIntentProtocol,
            model: model as DetailNoticeStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return DetailNoticeView(container: container)
    }
}
