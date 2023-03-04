import SwiftUI
import WatchRestAPIModule
import WatchDesignSystem

struct NoticeView: View {
    @StateObject var container: MVIContainer<NoticeIntentProtocol, NoticeStateProtocol>
    private let detailNoticeFactory: DetailNoticeFactory
    private var intent: any NoticeIntentProtocol { container.intent }
    private var state: any NoticeStateProtocol { container.model }

    init(
        container: MVIContainer<NoticeIntentProtocol, NoticeStateProtocol>,
        detailNoticeFactory: DetailNoticeFactory
    ) {
        _container = StateObject(wrappedValue: container)
        self.detailNoticeFactory = detailNoticeFactory
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 4) {
                ForEach(state.noticeList, id: \.id) { notice in
                    noticeListView(notice: notice)
                }
            }
        }
    }

    @ViewBuilder
    func noticeListView(notice: NoticeEntity) -> some View {
        HStack {
            VStack {
                Text(notice.title)
                    .dmsFont(.etc(.caption))

                Text(notice.createdAt.toSmallDMSString())
                    .dmsFont(.etc(.overline), color: .GrayScale.gray5)
            }

            Spacer()
        }
    }
}
