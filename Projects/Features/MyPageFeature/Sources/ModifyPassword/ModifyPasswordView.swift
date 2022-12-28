import DesignSystem
import Utility
import SwiftUI

struct ModifyPasswordView: View {
    private enum FocusField {
        case password
        case passwordCheck
    }

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: ModifyPasswordViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: ModifyPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 4) {
            DMSHeaderTitleView(subTitle: "새 비밀번호 설정")
                .padding(.top, 24)

            HStack {
                Text("비밀번호는 영문, 숫자, 기호를 포함한 8~20자이어야 합니다.")
                    .dmsFont(.etc(.caption), color: .GrayScale.gray5)

                Spacer()
            }

            VStack(spacing: 60) {
                SecureDMSFloatingTextField(
                    "새 비밀번호 입력",
                    text: $viewModel.password,
                    isError: viewModel.isPasswordRegexError,
                    errorMessage: "비밀번호가 형식이 올바르지 않습니다."
                ) {
                    focusField = .passwordCheck
                }
                .focused($focusField, equals: .password)

                SecureDMSFloatingTextField(
                    "새 비밀번호 확인 ",
                    text: $viewModel.passwordCheck,
                    isError: viewModel.isPasswordMismatchedError,
                    errorMessage: "비밀번호가 위와 일치하지 않습니다."
                ) {
                    viewModel.changePasswordButtonDidTap()
                }
                .focused($focusField, equals: .passwordCheck)
            }
            .padding(.top, 56)

            Spacer()

            DMSWideButton(text: "다음", color: .PrimaryVariant.primary) {
                viewModel.changePasswordButtonDidTap()
            }
            .disabled(!viewModel.iChangePasswordEnabled)
            .padding(.bottom, 40)
        }
        .hideKeyboardWhenTap()
        .onAppear {
            focusField = .password
        }
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onChange(of: viewModel.isSuccessRenewalPassword) { newValue in
            if newValue {
                NavigationUtil.popToRootView()
            }
        }
    }
}
