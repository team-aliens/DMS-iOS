import DesignSystem
import DomainModule
import SwiftUI

struct StudyRoomDetailView: View {
    @StateObject var viewModel: StudyRoomDetailViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: StudyRoomDetailViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var columns: [GridItem] {
        Array(repeating: GridItem(.flexible(), spacing: 40), count: viewModel.studyRoomDetail.totalWidthSize)
    }

    var body: some View {
        VStack {
            Spacer()

            studyRoomDetailBackView()
                .padding(.top, 204)
                .padding(.bottom, 0)
        }
        .dmsBackButton(dismiss: dismiss)
        .navigationTitle("자습실 자리 신청")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    func studyRoomDetailBackView() -> some View {
        VStack {
            studyRoomSeatView()
                .padding(.bottom, 6)

            HStack(spacing: 10) {
                DMSWideButton(text: "취소", style: .contained, color: .GrayScale.gray4)
                DMSWideButton(text: "신청", style: .contained, color: .System.primary)
            }
            .padding(.bottom, 40)

        }
        .padding(.horizontal, 24)
        .background {
            Color.GrayScale.gray1
                .cornerRadius(20)
        }
        .dmsShadow(style: .surface)
    }
}
