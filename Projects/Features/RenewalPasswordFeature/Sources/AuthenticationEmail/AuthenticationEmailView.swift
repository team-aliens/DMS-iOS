import SwiftUI
import DesignSystem

struct AuthenticationEmailView: View {
    @StateObject var viewModel: AuthenticationEmailViewModel
    let changePasswordComponent: ChangePasswordComponent
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: AuthenticationEmailViewModel,
        changePasswordComponent: ChangePasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.changePasswordComponent = changePasswordComponent
    }

    var body: some View {
        VStack {
            DMSHeaderTitleView(subTitle: "이메일 주소 입력")
                .padding(.top, 24)

            VStack(spacing: 40) {
                DMSPassCodeView(codeCount: 6, text: $viewModel.authCode)

                Text(viewModel.isErrorOcuured ? viewModel.errorMessage : "이메일로 전송된 인증코드 6자리를 입력해주세요.")
                    .dmsFont(.body(.body3), color: viewModel.isErrorOcuured ? .System.error : .GrayScale.gray5)
            }
            .padding(.top, 56)

            Text(viewModel.timeText)
                .dmsFont(.body(.body3), color: .PrimaryVariant.primary)
                .padding(.top, 10)

            Spacer()

            DMSButton(text: "인증코드 재발송", style: .underline, color: .GrayScale.gray6) {
                viewModel.sendEmailAuthCode()
            }

            DMSWideButton(text: "인증", color: .PrimaryVariant.primary) {
                viewModel.verifyEmailAuthCode()
            }
            .disabled(!viewModel.isVerifyEnable)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 24)
        .hideKeyboardWhenTap()
        .onAppear {
            viewModel.sendEmailAuthCode()
        }
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
        .navigate(
            to: changePasswordComponent.makeView(
                changePasswordParm: .init(
                    name: viewModel.authenticationEmailParam.name,
                    email: viewModel.authenticationEmailParam.email,
                    id: viewModel.authenticationEmailParam.id,
                    authCode: viewModel.authCode
                )
            ),
            when: $viewModel.isNavigateChangePassword
        )
        .dmsBackButton(dismiss: dismiss)

    }
}
