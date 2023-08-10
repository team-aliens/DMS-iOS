import SwiftUI
import DesignSystem
import UtilityModule
import RenewalPasswordFeatureInterface

struct AuthenticationEmailView: View {
    @StateObject var viewModel: AuthenticationEmailViewModel
    private let changePasswordFactory: any ChangePasswordFactory
    @Environment(\.dismiss) var dismiss
    @State var isViewDidLoad = false

    init(
        viewModel: AuthenticationEmailViewModel,
        changePasswordFactory: any ChangePasswordFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.changePasswordFactory = changePasswordFactory
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
        .onChange(of: viewModel.authCode) { newValue in
            if newValue.count == 6 {
                viewModel.verifyEmailAuthCode()
            }
        }
        .onAppear {
            if !isViewDidLoad {
                viewModel.sendEmailAuthCode()
            }
        }
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
        .navigate(
            to: changePasswordFactory.makeView(
                changePasswordParm: .init(
                    name: viewModel.authenticationEmailParam.name,
                    email: viewModel.authenticationEmailParam.email,
                    id: viewModel.authenticationEmailParam.id,
                    authCode: viewModel.authCode
                )
            )
            .eraseToAnyView(),
            when: $viewModel.isNavigateChangePassword
        )
        .dmsBackButton(dismiss: dismiss)
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
    }
}
