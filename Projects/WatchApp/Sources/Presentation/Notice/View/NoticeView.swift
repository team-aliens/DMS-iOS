import SwiftUI
import WatchRestAPIModule
import WatchDesignSystem

struct NoticeView: View {
    @StateObject var container: MVIContainer<NoticeIntentProtocol, NoticeStateProtocol>
    private var intent: any NoticeIntentProtocol { container.intent }
    private var state: any NoticeStateProtocol { container.model }
    
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
                    .dmsFont(.etc(.overline))
            }

            Spacer()
        }
    }
}
