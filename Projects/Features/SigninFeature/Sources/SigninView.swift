import SwiftUI

struct SigninView: View {
    @StateObject var viewModel: SigninViewModel

    public init(viewModel: SigninViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Hello, World!")
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView(viewModel: .init())
    }
}
