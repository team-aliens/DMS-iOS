import SwiftUI
import WatchRestAPIModule
import WatchDesignSystem

struct DetailNoticeView: View {
    @StateObject var container: MVIContainer<DetailNoticeIntentProtocol, DetailNoticeStateProtocol>
    private var intent: any DetailNoticeIntentProtocol { container.intent }
    private var state: any DetailNoticeStateProtocol { container.model }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 4) {
                if let notice = state.notice {
                    Text(notice.title)
                        .dmsFont(.body(.body3))

                    Text(notice.createdAt.toSmallDMSString())
                        .dmsFont(.etc(.overline), color: .GrayScale.gray5)

                    Divider()

                    Text(notice.content)
                        .lineLimit(nil)
                } else {
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            .padding(.horizontal, 8)
        }
    }
}
