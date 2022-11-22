import DesignSystem
import SwiftUI

struct ModifyPasswordView: View {
    @StateObject var viewModel: ModifyPasswordViewModel

    init(
        viewModel: ModifyPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("hello")
    }
}
