import DesignSystem
import DomainModule
import SwiftUI

struct RemainApplyView: View {
    @StateObject var viewModel: RemainApplyViewModel
    @Environment(\.dismiss) var dismiss
    @State private var selectedObject: RemainOptionEntity?

    @State private var isEnabled: Bool = false

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
                RemainApplyListView(viewModel: viewModel, selectedObject: $selectedObject)
                    .padding(.horizontal, 24)
            }

            DMSWideButton(
                text: {
                    if isEnabled {
                        return "신청 완료"
                    } else if viewModel.myRemainsApplicationItems?.title == selectedObject?.title {
                        return selectedObject?.title ?? "nul" + "로 변경하기"
                    } else {
                        return selectedObject?.title ?? "nul" + " 신청하기"
                    }
                }(),
                style: .contained,
                color: .PrimaryVariant.primary,
                action: {
                    viewModel.remainingApplicationsChanges(id: selectedObject?.id ?? "")
                })
            .disabled(isEnabled)
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
        .onAppear {
            isEnabled = {
                selectedObject?.isApplied ?? false
            }()
            viewModel.fetchMyRemainApplicationItems()
        }
    }
}
