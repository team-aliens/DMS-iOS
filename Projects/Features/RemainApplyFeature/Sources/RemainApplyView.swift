import DesignSystem
import SwiftUI

struct RemainApplyView: View {
    @AppStorage("RemainState") var remainState: String?
    @StateObject var viewModel: RemainApplyViewModel
    @Environment(\.dismiss) var dismiss

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
                RemainApplyListCellView(viewModel: viewModel)
                    .padding(.horizontal, 24)
            }

            DMSWideButton(
                text: {
                    if viewModel.isAlreadyApplied && (viewModel.selectedType == viewModel.appliedState) {
                        return "신청 완료"
                    } else if viewModel.isAlreadyApplied && (viewModel.selectedType != viewModel.appliedState) {
                        return viewModel.selectedType + "로 변경하기"
                    } else {
                        return viewModel.selectedType + " 신청하기"
                    }
                }(),
                style: .contained,
                color: {
                    if viewModel.isAlreadyApplied && (viewModel.selectedType == viewModel.appliedState) {
                        return .System.primary.opacity(0.5)
                    } else if viewModel.selectedType.isEmpty {
                        return .clear
                    } else {
                        return .System.primary
                    }
                }(),
                action: {
                    viewModel.appliedState = viewModel.selectedType
                    viewModel.isAlreadyApplied = true
                    viewModel.appliedStateNum = viewModel.selectedNum
                    remainState = viewModel.appliedState
                })
            .padding(.bottom, 71)
            .padding(.horizontal, 24)
        }
        .navigationTitle("잔류 신청")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
        .dmsToast(
            isShowing: $viewModel.isErrorOcuured,
            message: viewModel.toastMessage,
            style: .error
        )
    }
}
