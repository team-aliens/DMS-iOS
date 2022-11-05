import DesignSystem
import SwiftUI

struct NoticeView: View {
    @StateObject var viewModel: NoticeViewModel
    @State var isNavigateSignup = false

    init(
        viewModel: NoticeViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()

                    NoticeOrderButton(text: "최신순", color: .GrayScale.gray6)
                        .padding(.horizontal, 24)
                }
                .padding(.top, 12)

                ScrollView {
                    VStack {
                        Spacer()
                            .frame(height: 10)

                        ForEach(viewModel.noticeList, id: \.self) { noticeList in
                            noticeListCellView(
                                title: noticeList.title,
                                content: noticeList.content
                            )
                            .padding(.top, 5)
                            .listRowInsets(EdgeInsets())

                        }
                    }
                    .padding(.horizontal, 24)

                }
            }
            .navigationTitle("공지")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    @ViewBuilder
    func noticeListCellView(title: String, content: String) -> some View {
        ZStack {
            Color.System.surface
                .cornerRadius(6)

            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .dmsFont(.text(.medium), color: .System.title)

                    Text(content)
                        .dmsFont(.text(.extraSmall), color: .System.text)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 68)
        .shadow(color: .GrayScale.gray5.opacity(0.15), blur: 20)

    }
}
