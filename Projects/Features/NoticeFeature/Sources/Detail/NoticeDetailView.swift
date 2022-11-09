import DesignSystem
import SwiftUI
import Utility

struct NoticeDetailView: View {
    @StateObject var viewModel: NoticeDetailViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 24) {
                Text(viewModel.title)
                    .dmsFont(.title(.small), color: .GrayScale.gray7)
                    .padding(.top, 40)

                Divider()
            }
            VStack(alignment: .leading, spacing: 24) {
                Text(viewModel.content)
                    .padding(.top, 24)
                    .padding(.bottom, 40)

                HStack {
                    Spacer()

                    Text(viewModel.date.toDMSDateString())
                        .dmsFont(.text(.extraSmall), color: .GrayScale.gray5)
                        .frame(alignment: .trailing)
                }
            }

            Spacer()
        }
        .navigationTitle("공지")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal, 24)

        Spacer()
    }
}
