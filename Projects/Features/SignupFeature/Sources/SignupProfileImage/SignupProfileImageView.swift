import SwiftUI

struct SignupProfileImageView: View {
    @StateObject var viewModel: SignupProfileImageViewModel

    public init(viewModel: SignupProfileImageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            
        }
    }
}
