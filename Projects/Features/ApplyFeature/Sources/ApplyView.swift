import DesignSystem
import SwiftUI

struct ApplyView: View {
    @StateObject var viewModel: ApplyViewModel

    init(
        viewModel: ApplyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
