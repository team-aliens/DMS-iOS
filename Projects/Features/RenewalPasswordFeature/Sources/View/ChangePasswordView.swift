import SwiftUI
import DesignSystem

struct ChangePasswordView: View {
    @StateObject var viewModel: ChangePasswordViewModel

    public init(viewModel: ChangePasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("ChangePasswordView")
    }
}
