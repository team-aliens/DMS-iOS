import DesignSystem
import SwiftUI

struct SetNotificationView: View {
    @StateObject var viewModel: SetNotificationViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SetNotificationViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Text("공지")
                .dmsFont(.title(.title3), color: .GrayScale.gray6)

            HStack {
                VStack {
                    Text("공지 알림")
                        .dmsFont(.body(.body2), color: .GrayScale.gray8)
                    Text("기숙사 공지에 대한 알림입니다.")
                        .dmsFont(.etc(.caption), color: .GrayScale.gray6)
                }
                Spacer()
                Toggle("공지 알림", isOn: $viewModel.isNoticeOn)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .PrimaryVariant.primary))
            }
        }
        .frame(maxWidth: .infinity)
        .dmsBackButton(dismiss: dismiss)
        .navigationTitle("알림 현황")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
    }
}
