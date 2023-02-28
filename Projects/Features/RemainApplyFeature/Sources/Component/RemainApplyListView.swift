import DesignSystem
import DomainModule
import SwiftUI

struct RemainApplyListView: View {
    @StateObject var viewModel: RemainApplyViewModel

    var body: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.remainApplicationList.remainOptions, id: \.self) { remainApplication in
                RemainApplyListCellView(
                    list: remainApplication,
                    isSelected: remainApplication.id == viewModel.selectedEntity?.id,
                    action: {
                        viewModel.selectedEntity = remainApplication
                    }
                )
            }
        }
        .onAppear {
            viewModel.fetchRemainApplicationList()
        }
    }
}
