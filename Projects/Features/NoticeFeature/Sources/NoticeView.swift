import DesignSystem
import SwiftUI

struct NoticeView: View {
    @StateObject var viewModel: NoticeViewModel

    init(
        viewModel: NoticeViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
