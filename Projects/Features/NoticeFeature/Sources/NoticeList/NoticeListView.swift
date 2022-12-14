import DesignSystem
import Utility
import SwiftUI

struct NoticeListView: View {
    @StateObject var viewModel: NoticeListViewModel
    private let noticeDetailComponent: NoticeDetailComponent

    init(
        viewModel: NoticeListViewModel,
        noticeDetailComponent: NoticeDetailComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.noticeDetailComponent = noticeDetailComponent
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()

                    DMSButton(
                        text: viewModel.noticeOrderType.display,
                        style: .shortPaddingOutlined,
                        color: .GrayScale.gray6
                    ) {
                        withAnimation {
                            viewModel.orderTypeButtonDidTap()
                        }
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.top, 12)

                ScrollView {
                    LazyVStack {
                        Spacer()
                            .frame(height: 10)

                        ForEach(viewModel.noticeList, id: \.self) { noticeList in
                            NavigationLink(destination: noticeDetailComponent.makeView(id: noticeList.id)) {
                                noticeListCellView(
                                    title: noticeList.title,
                                    date: noticeList.createdAt
                                )
                                .padding(.top, 5)
                                .listRowInsets(EdgeInsets())
                            }
                        }
                        Spacer()
                            .frame(height: 80)

                    }
                    .padding(.horizontal, 24)
                }
            }
            .navigationTitle("공지")
            .navigationBarTitleDisplayMode(.inline)
            .dmsBackground()
            .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
            .onAppear {
                viewModel.onAppear()
            }
        }
    }

    @ViewBuilder
    func noticeListCellView(title: String, date: Date) -> some View {
        ZStack {
            Color.System.surface
                .cornerRadius(6)

            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .dmsFont(.body(.body2), color: .System.backgroundTitle)

                    Text("\(String(date.year))/\(date.month)/\(date.day)")
                        .dmsFont(.etc(.caption), color: .System.backgroundText)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 68)
        .dmsShadow(style: .surface)
    }
}
