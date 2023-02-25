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

    var rows: [GridItem] {
        Array(
            repeating: GridItem(.flexible(), spacing: 40),
            count: viewModel.studyRoomDetail?.totalHeightSize ?? 0
        )
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
                .edgesIgnoringSafeArea(.bottom)
        }
        .dmsBackButton(dismiss: dismiss)
        .navigationTitle("자습실 자리 신청")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
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
                DMSWideButton(text: "취소", style: .contained, color: .GrayScale.gray4) {
                    viewModel.cancelStudyRoomSeat()
                }

                DMSWideButton(text: "신청", style: .contained, color: .System.primary) {
                    viewModel.applyStudyRoomSeat()
                }
                .disabled(viewModel.selectedSeat == nil)
            }
            .padding(.bottom, 40)

        }
        .padding(.horizontal, 24)
        .background {
            Color.System.background
                .ignoresSafeArea()
                .cornerRadius(20)
        }
        .dmsShadow(style: .surface)
    }
}
