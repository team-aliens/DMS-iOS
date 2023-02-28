import DesignSystem
import DomainModule
import SwiftUI

struct RemainApplyListView: View {
    @StateObject var viewModel: RemainApplyViewModel
    @Binding var selectedObject: RemainOptionEntity?

    var body: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.remainApplicationList.remainOptions, id: \.self) { remainApplication in
                RemainApplyListCellView(
                    list: remainApplication,
                    isSelected: remainApplication == selectedObject,
                    action: {
                        selectedObject = remainApplication
                    },
                    selectedObject: $selectedObject
                )
            }
        }
        .onAppear {
            viewModel.fetchRemainApplicationList()
        }
    }
}
