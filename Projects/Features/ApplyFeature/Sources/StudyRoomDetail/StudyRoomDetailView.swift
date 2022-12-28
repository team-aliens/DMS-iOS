import BaseFeature
import DesignSystem
import DomainModule
import SwiftUI

struct StudyRoomDetailView: View {
    @StateObject var viewModel: StudyRoomDetailViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.tabbarHidden) var tabbarHidden

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
            StudyRoomNoticeView(text: viewModel.availableTimeString)
                .padding(.top, 12)

            StudyRoomListCellView(
                studyRoomEntity: viewModel.studyRoomEntity
            )
            .padding(.horizontal, 24)
            .padding(.top, 30)

            studyRoomDetailBackView()
                .padding(.top, 20)
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
            Color.System.surface
                .cornerRadius(20)
        }
        .dmsShadow(style: .surface)
    }
}
