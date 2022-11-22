import DesignSystem
import Utility
import SwiftUI

struct CheckPasswordView: View {

    @StateObject var viewModel: CheckPasswordViewModel
    let modifyPasswordComponent: ModifyPasswordComponent
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: CheckPasswordViewModel,
        modifyPasswordComponent: ModifyPasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.modifyPasswordComponent = modifyPasswordComponent
    }

    var body: some View {
        VStack(spacing: 4) {
            AuthHeaderView(subTitle: "새 비밀번호 설정")
                .padding(.top, 24)

            SecureDMSFloatingTextField(
                "비밀번호",
                text: $viewModel.password,
                isError: viewModel.isPasswordRegexError,
                errorMessage: "유효하지 않은 비밀번호입니다."
            ) {
                viewModel.checkPasswordButtonDidTap()

            }
            .padding(.top, 56)

            Spacer()

            DMSWideButton(text: "다음", color: .PrimaryVariant.primary) {
                viewModel.checkPasswordButtonDidTap()
            }
            .disabled(!viewModel.isCheckPasswordEnabled)
            .padding(.bottom, 40)
        }
        .hideKeyboardWhenTap()
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.errorMessage, style: .error)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .navigate(
            to: modifyPasswordComponent.makeView(
                currentPassword: viewModel.password
            ),
            when: $viewModel.isSuccessCheckPassword
        )
    }
}
