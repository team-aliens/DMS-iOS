import DesignSystem
import SwiftUI

struct SignupEmailVerifyView: View {
    private enum FocusField {
        case email
    }
    @StateObject var viewModel: SignupEmailVerifyViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @Environment(\.dismiss) var dismiss
    @FocusState private var focusField: FocusField?
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
            AuthHeaderView(subTitle: "이메일 주소 입력")
                .padding(.top, 24)

            DMSFloatingTextField(
                "이메일 주소",
                text: $viewModel.email,
                isError: viewModel.isErrorOcuured,
                errorMessage: viewModel.errorMessage
            ) {
                viewModel.sendButtonDidTap()
            }
            .focused($focusField, equals: .email)
            .padding(.top, 56)

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
                    signupEmailVerifyParam: viewModel.signupEmailVerifyParam,
                    email: viewModel.email
                )
            ),
            when: $viewModel.isNavigateSignupEmailAuthCodeVerify
        )
        .onAppear {
            focusField = .email
        }
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
    }
}
