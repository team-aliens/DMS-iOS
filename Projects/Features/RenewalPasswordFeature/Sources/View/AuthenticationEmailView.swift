import SwiftUI
import DesignSystem

struct AuthenticationEmailView: View {
    @StateObject var viewModel: AuthenticationEmailViewModel

    public init(viewModel: AuthenticationEmailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        Text("AuthenticationEmailView")
    }
}
