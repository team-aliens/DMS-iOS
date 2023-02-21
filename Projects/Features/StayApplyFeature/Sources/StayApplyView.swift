import DesignSystem
import SwiftUI

struct StayApplyView: View {
    @StateObject var viewModel: StayApplyViewModel
    @Environment(\.dismiss) var dismiss
    @StateObject var uiState = StayStateModel()

    init(
        viewModel: StayApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 1)

            ScrollView(showsIndicators: false) {
                if viewModel.isApplicationTime {
                    StayApplyNoticeView(notice: viewModel.rangeString)
                }
                StayApplyListCellView()
            }

            DMSWideButton(
                text: uiState.currentSelectedType + (uiState.isAlreadyApplied ? "로 변경하기" : "신청하기"),
                style: .contained,
                color: uiState.isAlreadyApplied ? .System.primary.opacity(0.5) : .System.primary,
                action: {
                    print(uiState.currentSelectedType + (uiState.isAlreadyApplied ? "로 변경하기" : "신청하기"))
                })
            .padding(.bottom, 71)
        }
        .environmentObject(uiState)
        .navigationTitle("잔류 신청")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
        .dmsToast(isShowing: $viewModel.isErrorOcuured,
                  message: viewModel.rangeString,
                  style: .error)
        .padding(.horizontal, 24)
    }
}
