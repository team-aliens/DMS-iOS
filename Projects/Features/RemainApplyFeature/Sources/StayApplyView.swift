import DesignSystem
import SwiftUI

struct RemainApplyView: View {
    @StateObject var viewModel: RemainApplyViewModel
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var uiState: RemainStateModel

    init(
        viewModel: RemainApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 1)

            ScrollView(showsIndicators: false) {
                if viewModel.isApplicationTime {
                    RemainApplyNoticeView(notice: viewModel.rangeString)
                }
                RemainApplyListCellView()
                    .padding(.horizontal, 24)
            }

            DMSWideButton(
                text: {
                    if uiState.isAlreadyApplied && (uiState.selectedType == uiState.appliedState) {
                        return "신청 완료"
                    } else if uiState.isAlreadyApplied && (uiState.selectedType != uiState.appliedState) {
                        return uiState.selectedType + "로 변경하기"
                    } else {
                        return uiState.selectedType + " 신청하기"
                    }
                }(),
                style: .contained,
                color: {
                    if uiState.isAlreadyApplied && (uiState.selectedType == uiState.appliedState) {
                        return .System.primary.opacity(0.5)
                    } else if uiState.selectedType.isEmpty {
                        return .clear
                    } else {
                        return .System.primary
                    }
                }(),
                action: {
                    uiState.appliedState = uiState.selectedType
                    uiState.isAlreadyApplied = true
                    uiState.appliedStateNum = uiState.selectedNum
                })
            .padding(.bottom, 71)
            .padding(.horizontal, 24)
        }
        .environmentObject(uiState)
        .navigationTitle("잔류 신청")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
        .dmsToast(isShowing: $viewModel.isErrorOcuured,
                  message: viewModel.toastMessage,
                  style: .error)
    }
}
