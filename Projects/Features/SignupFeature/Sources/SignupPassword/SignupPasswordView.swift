import DesignSystem
import SwiftUI

struct SignupPasswordView: View {
    private enum FocusField {
        case password
        case passwordCheck
    }
    @StateObject var viewModel: SignupPasswordViewModel
    @FocusState private var focusField: FocusField?

    public init(
        viewModel: SignupPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 4) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)

                    Text("학교 인증코드 입력")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)

                    Text("비밀번호는 영문, 숫자, 기호를 포함한 8~20자이어야 합니다.")
                        .dmsFont(.text(.extraSmall), color: .GrayScale.gray5)
                }

                Spacer()
            }
            .padding(.top, 24)

            VStack(spacing: 56) {
                SecureDMSFloatingTextField(
                    "비밀번호",
                    text: $viewModel.password,
                    isError: viewModel.isPasswordRegexError,
                    errorMessage: "비밀번호 형식이 올바르지 않습니다."
                ) {
                    focusField = .passwordCheck
                }
                .padding(.top, 56)
                .focused($focusField, equals: .password)

                SecureDMSFloatingTextField(
                    "비밀번호 확인",
                    text: $viewModel.passwordCheck,
                    isError: viewModel.isPasswordMismatchedError,
                    errorMessage: "비밀번호가 일치하지 않습니다."
                ) {
                    viewModel.nextButtonDidTap()
                }
                .focused($focusField, equals: .passwordCheck)
            }

            Spacer()

            DMSWideButton(text: "다음", color: .PrimaryVariant.primary) {
                viewModel.nextButtonDidTap()
            }
            .padding(.bottom, 40)
        }
        .dmsBackground()
        .padding(.horizontal, 24)
    }
}
