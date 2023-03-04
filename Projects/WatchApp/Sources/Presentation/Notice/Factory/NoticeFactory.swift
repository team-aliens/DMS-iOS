import SwiftUI
import WatchRestAPIModule

struct NoticeFactory {
    private let noticeRepository: any NoticeRepository

    init(noticeRepository: any NoticeRepository) {
        self.noticeRepository = noticeRepository
    }

    func makeView() -> some View {
        let model = NoticeModel()
        let intent = NoticeIntent(model: model, noticeRepository: noticeRepository)
        let container = MVIContainer(
            intent: intent as NoticeIntentProtocol,
            model: model as NoticeStateProtocol,
            modelChangePublisher: model.objectWillChange
        )
        return NoticeView(container: container)
    }
}
