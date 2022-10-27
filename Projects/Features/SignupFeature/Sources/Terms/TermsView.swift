import SwiftUI
import WebKit

struct TermsView: View {
    @StateObject var viewModel: TermsViewModel

    init(
        viewModel: TermsViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            
        }
    }
}
