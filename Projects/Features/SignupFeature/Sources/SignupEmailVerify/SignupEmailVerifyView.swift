import DesignSystem
import SwiftUI

struct SignupEmailVerifyView: View {
    @StateObject var viewModel: SignupEmailVerifyViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @Environment(\.dismiss) var dismiss
    let signupEmailAuthCodeVerifyComponent: SignupEmailAuthCodeVerifyComponent

    public init(
        viewModel: SignupEmailVerifyViewModel,
        signupEmailAuthCodeVerifyComponent: SignupEmailAuthCodeVerifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupEmailAuthCodeVerifyComponent = signupEmailAuthCodeVerifyComponent
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

            DMSFloatingTextField(
                "이메일 주소",
                text: $viewModel.email,
                isError: viewModel.isErrorOcuured,
                errorMessage: viewModel.errorMessage
            ) {
                viewModel.sendButtonDidTap()
            }
            .padding(.top, 68)

            Spacer()

            HStack(spacing: 6) {
                Text("이미 계정이 있으신가요?")
                    .dmsFont(.text(.small), color: .GrayScale.gray5)

                DMSButton(text: "로그인", style: .text, color: .GrayScale.gray6) {
                    rootPresentationMode.wrappedValue.toggle()
                }
            }

            DMSWideButton(text: "인증코드 발송", color: .PrimaryVariant.primary) {
                viewModel.sendButtonDidTap()
            }
            .disabled(!viewModel.isSendEnabled)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
        .navigate(
            to: signupEmailAuthCodeVerifyComponent.makeView(
                signupEmailAuthCodeVerifyParam: .init(
                    schoolCode: viewModel.signupEmailVerifyParam.schoolCode,
                    schoolAnswer: viewModel.signupEmailVerifyParam.schoolAnswer,
                    email: viewModel.email
                )
            ),
            when: $viewModel.isNavigateSignupEmailAuthCodeVerify
        )
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
    }
}
