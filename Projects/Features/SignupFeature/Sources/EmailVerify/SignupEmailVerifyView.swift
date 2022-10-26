import SwiftUI

struct SignupEmailVerifyView: View {
    @StateObject var viewModel: SignupEmailVerifyViewModel

    public init(viewModel: SignupEmailVerifyViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Hello, World!")
    }
}

struct SignupEmailVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        SignupEmailVerifyView()
    }
}
