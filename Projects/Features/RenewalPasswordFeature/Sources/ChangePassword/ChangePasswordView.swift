import SwiftUI
import DesignSystem
import Utility

struct ChangePasswordView: View {
    private enum FocusField {
        case password
        case passwordCheck
    }

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: ChangePasswordViewModel
    @Environment(\.dismiss) var dismiss

    public init(viewModel: ChangePasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 4) {
            DMSHeaderTitleView(subTitle: "비밀번호 설정")
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
                    viewModel.renewalPasswordButtonDidTap()
                }
                .focused($focusField, equals: .passwordCheck)
            }
            .padding(.top, 56)

            Spacer()

            DMSWideButton(text: "확인", color: .PrimaryVariant.primary) {
                viewModel.renewalPasswordButtonDidTap()
            }
            .disabled(!viewModel.isRenewalPasswordEnabled)
            .padding(.bottom, 40)
        }
        .hideKeyboardWhenTap()
        .onAppear {
            focusField = .password
        }
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .alert("비밀번호가 변경되었습니다.", isPresented: $viewModel.isSuccessRenewalPassword) {
            Button("로그인 화면 이동") {
                NavigationUtil.popToRootView()
            }
        }
    }
}
