import SwiftUI
import DesignSystem

struct AuthenticationEmailView: View {
    @StateObject var viewModel: AuthenticationEmailViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: AuthenticationEmailViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)

                    Text("이메일 주소 입력")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                }

                Spacer()
            }
            .padding(.top, 24)

            VStack(spacing: 40) {
                DMSPassCodeView(codeCount: 6, text: $viewModel.authCode)

                Text(viewModel.isErrorOcuured ? viewModel.errorMessage : "이메일로 전송된 인증코드 6자리를 입력해주세요.")
                    .dmsFont(.text(.small), color: viewModel.isErrorOcuured ? .System.error : .GrayScale.gray5)
            }
            .padding(.top, 60)

            Text(viewModel.timeText)
                .dmsFont(.text(.small), color: .PrimaryVariant.primary)
                .padding(.top, 10)

            Spacer()

            DMSButton(text: "인증코드 재발송", style: .underline, color: .GrayScale.gray6) {
                viewModel.sendEmailAuthCode()
            }

            DMSWideButton(text: "인증", color: .PrimaryVariant.primary) {
                viewModel.verifyEmailAuthCode()
            }
            .padding(.top, 32)
            .padding(.bottom, 40)
        }
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .onAppear {
            UIApplication.shared.hideKeyboard()
            viewModel.sendEmailAuthCode()
        }
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
    }
}
