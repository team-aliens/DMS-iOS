import DesignSystem
import SwiftUI

struct ApplicationView: View {
    @StateObject var viewModel: ApplicationViewModel

    init(
        viewModel: ApplicationViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
