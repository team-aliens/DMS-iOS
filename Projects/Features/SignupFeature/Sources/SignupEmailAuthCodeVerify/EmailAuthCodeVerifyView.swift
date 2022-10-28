import BaseFeature
import DesignSystem
import SwiftUI

struct SignupEmailAuthCodeVerifyView: View {
    @StateObject var viewModel: SignupEmailAuthCodeVerifyViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SignupEmailAuthCodeVerifyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            AuthHeaderView(subTitle: "이메일 주소 입력")
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
        .dmsBackground()
        .padding(.horizontal, 24)
        .hideKeyboardWhenTap()
        .onAppear {
            viewModel.sendEmailAuthCode()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
    }
}
