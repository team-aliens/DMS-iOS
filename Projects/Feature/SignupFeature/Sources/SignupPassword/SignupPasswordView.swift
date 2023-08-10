import DesignSystem
import SwiftUI
import SignupFeatureInterface
import UtilityModule

struct SignupPasswordView: View {
    private enum FocusField {
        case password
        case passwordCheck
    }
    @StateObject var viewModel: SignupPasswordViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss
    private let signupProfileImageFactory: any SignupProfileImageFactory

    public init(
        viewModel: SignupPasswordViewModel,
        signupProfileImageFactory: any SignupProfileImageFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupProfileImageFactory = signupProfileImageFactory
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
        .padding(.horizontal, 24)
        .dmsBackground()
        .onAppear {
            focusField = .password
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .dmsBackButton(dismiss: dismiss)
        .navigate(
            to: signupProfileImageFactory.makeView(
                signupProfileImageParam: .init(
                    signupPasswordParam: viewModel.signupPasswordParam,
                    password: viewModel.password
                )
            )
            .eraseToAnyView(),
            when: $viewModel.isNavigateSignupProfileImage
        )
    }
}
