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
        ZStack {
            ScrollView {
                LazyVStack(spacing: 4) {
                    ForEach(state.noticeList, id: \.id) { notice in
                        NavigationLink {
                            DeferView {
                                detailNoticeFactory.makeView(noticeID: notice.id)
                            }
                        } label: {
                            noticeListView(notice: notice)
                        }
                    }
                }
                .padding(.horizontal, 8)
            }

            if state.noticeList.isEmpty, !state.isLoading {
                Text("아이폰에서 먼저 로그인을 해주세요!")
            }
        }
        .onAppear {
            intent.onAppear()
        }
    }

    @ViewBuilder
    func noticeListView(notice: NoticeEntity) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(notice.title)
                    .multilineTextAlignment(.leading)
                    .dmsFont(.etc(.caption))

                Text(notice.createdAt.toSmallDMSString())
                    .dmsFont(.etc(.overline), color: .GrayScale.gray5)
            }

            Spacer()
        }
    }
}
