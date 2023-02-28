import DesignSystem
import DomainModule
import SwiftUI

struct RemainApplyView: View {
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
                RemainApplyNoticeView(notice: viewModel.rangeString)
                RemainApplyListView(viewModel: viewModel)
                    .padding(.horizontal, 24)
            }

            DMSWideButton(
                text: viewModel.buttonTitle,
                style: .contained,
                color: .PrimaryVariant.primary,
                action: {
                    viewModel.changeRemainApply()
                })
            .disabled(viewModel.selectedEntity?.title == viewModel.myRemainsApplicationItems?.title)
            .padding(.bottom, 71)
            .padding(.horizontal, 24)
            .opacity(viewModel.selectedEntity == nil ? 0 : 1)
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
        .onAppear {
            viewModel.fetchRemainsAvailableTime()
            viewModel.fetchMyRemainApplicationItems()
        }
    }
}
