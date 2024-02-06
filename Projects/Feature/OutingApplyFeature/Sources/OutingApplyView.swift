import SwiftUI
import DesignSystem

struct OutingApplyView: View {
    @StateObject var viewModel: OutingApplyViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: OutingApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            OutingApplyNoticeView(notice: viewModel.rangeString)
        }
        .navigationTitle("외출 신청")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .bottom)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
    }
}
