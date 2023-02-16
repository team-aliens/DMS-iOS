import DesignSystem
import SwiftUI

struct ApplyPageView: View {
    @StateObject var viewModel: ApplyPageViewModel

    init(
        viewModel: ApplyPageViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
