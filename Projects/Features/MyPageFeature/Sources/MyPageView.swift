import DesignSystem
import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel

    init(
        viewModel: MyPageViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
