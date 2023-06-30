import DesignSystem
import SwiftUI

struct SetNotificationView: View {
    @StateObject var viewModel: SetNotificationViewModel

    init(
        viewModel: SetNotificationViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
