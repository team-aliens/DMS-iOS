import DesignSystem
import SwiftUI

struct StayApplyView: View {
    @StateObject var viewModel: StayApplyViewModel

    init(
        viewModel: StayApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
