import SwiftUI
import DesignSystem

struct SchoolConfirmationQuestionsView: View {
    private enum FocusField {
        case answer
    }
    @StateObject var viewModel: SchoolConfirmationQuestionsViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @FocusState private var focusField: FocusField?
    private let signupEmailVerifyComponent: SignupEmailVerifyComponent

    public init(
        viewModel: SchoolConfirmationQuestionsViewModel,
        signupEmailVerifyComponent: SignupEmailVerifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupEmailVerifyComponent = signupEmailVerifyComponent
    }

    var body: some View {
        VStack {
            DMSHeaderTitleView(subTitle: "학교 확인 질문")
                .padding(.top, 24)

            HStack {
                Text(viewModel.question)
                    .dmsFont(.body(.body2), color: .GrayScale.gray7)

                Spacer()
            }
            .padding(.top, 50)

            VStack(spacing: 72) {
                DMSFloatingTextField(
                    "답변",
                    text: $viewModel.answer,
                    isError: viewModel.isErrorOcuured,
                    errorMessage: viewModel.errorMessage
                ) {
                    viewModel.confirmButtonDidTap()
                }
                .focused($focusField, equals: .answer)
            }
            .padding(.top, 42)

            Spacer()

            HStack(spacing: 16) {
                Text("이미 계정이 있으신가요?")
                    .dmsFont(.body(.body3), color: .GrayScale.gray5)

                DMSButton(text: "로그인", style: .text, color: .GrayScale.gray6) {
                    rootPresentationMode.wrappedValue.toggle()
                }
            }

            DMSWideButton(text: "확인", color: .PrimaryVariant.primary) {
                viewModel.confirmButtonDidTap()
            }
            .disabled(!viewModel.isConfirmEnabled)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
        .hideKeyboardWhenTap()
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .dmsBackground()
        .onAppear {
            viewModel.onAppear()
            focusField = .answer
        }
        .navigationTitle("회원가입")
        .navigate(
            to: signupEmailVerifyComponent.makeView(
                signupEmailVerifyParam: .init(
                    schoolConfirmationQuestionsParam: viewModel.schoolConfirmationQuestionsParam,
                    schoolAnswer: viewModel.answer
                )
            ),
            when: $viewModel.isNavigateSignupEmailVerify
        )
    }
}
