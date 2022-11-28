import DesignSystem
import SwiftUI
import Utility

struct NoticeDetailView: View {
    @StateObject var viewModel: NoticeDetailViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(viewModel.title)
                        .dmsFont(.title(.title1), color: .GrayScale.gray7)

                    Text(viewModel.displayDate)
                        .dmsFont(.etc(.caption), color: .GrayScale.gray5)
                        .padding(.top, 10)

                    Divider()
                        .padding(.top, 20)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 40)

                Text(viewModel.content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .dmsFont(.body(.body2), color: .GrayScale.gray6)
                    .padding(.top, 24)

                Spacer()
            }
        }
        .navigationTitle("공지")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal, 24)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
    }
}
