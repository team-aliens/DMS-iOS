import DesignSystem
import SwiftUI

struct StayApplyView: View {
    @StateObject var viewModel: StayApplyViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: StayApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text("ㅎㅇㅎㅇ")
            }
            .navigationTitle("잔류 신청")
            .navigationBarTitleDisplayMode(.inline)
            .dmsBackground()
            .dmsBackButton(dismiss: dismiss)
        }
    }
}
