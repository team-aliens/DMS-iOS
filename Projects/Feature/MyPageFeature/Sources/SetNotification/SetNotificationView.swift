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
        VStack(alignment: .leading) {
            Text("공지")
                .dmsFont(.title(.title3), color: .GrayScale.gray6)
                .padding(.bottom, 15)

            HStack {
                VStack(alignment: .leading) {
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
            .padding(.bottom, 30)

            Text("자습실")
                .dmsFont(.title(.title3), color: .GrayScale.gray6)
                .padding(.bottom, 15)

            HStack {
                VStack(alignment: .leading) {
                    Text("이용 시간 알림")
                        .dmsFont(.body(.body2), color: .GrayScale.gray8)
                    Text("자습실 이용 시작 10분 전에 알림을 받을 수 있습니다.")
                        .dmsFont(.etc(.caption), color: .GrayScale.gray6)
                }
                Spacer()
                Toggle("이용 시간 알림", isOn: $viewModel.isTimeSlotOn)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .PrimaryVariant.primary))
            }
            .padding(.bottom, 30)

            HStack {
                VStack(alignment: .leading) {
                    Text("신청 시간 알림")
                        .dmsFont(.body(.body2), color: .GrayScale.gray8)
                    Text("자습실 신청 시간을 알리는 알림입니다.")
                        .dmsFont(.etc(.caption), color: .GrayScale.gray6)
                }
                Spacer()
                Toggle("신청 시간 알림", isOn: $viewModel.isAvailableTimeOn)
                    .labelsHidden()
                    .toggleStyle(SwitchToggleStyle(tint: .PrimaryVariant.primary))
            }

            Spacer()
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity)
        .dmsBackButton(dismiss: dismiss)
        .navigationTitle("알림 현황")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
    }
}
