import SwiftUI
import DesignSystem

struct SchoolCodeView: View {
    @StateObject var viewModel: SchoolCodeViewModel
    @Environment(\.dismiss) var dismiss
    private let schoolConfirmationQuestionsComponent: SchoolConfirmationQuestionsComponent

    public init(
        viewModel: SchoolCodeViewModel,
        schoolConfirmationQuestionsComponent: SchoolConfirmationQuestionsComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.schoolConfirmationQuestionsComponent = schoolConfirmationQuestionsComponent
    }

    var body: some View {
        VStack {
            DMSHeaderTitleView(subTitle: "학교 인증코드 입력")
                .padding(.top, 24)

            VStack(spacing: 24) {
                DMSPassCodeView(codeCount: 8, text: $viewModel.schoolCode)

                Text(viewModel.isErrorOcuured ? viewModel.errorMessage : "이메일로 전송된 인증코드 8자리를 입력해주세요.")
                    .dmsFont(.body(.body3), color: viewModel.isErrorOcuured ? .System.error : .GrayScale.gray5)
            }
            .padding(.top, 56)

            Spacer()

            DMSWideButton(text: "인증", color: .PrimaryVariant.primary) {
                viewModel.verifyAuthCodeButtonDidTap()
            }
            .disabled(!viewModel.isEnabledVerify)
            .padding(.bottom, 40)
        }
        .onAppear {
            viewModel.schoolCode = ""
        }
        .hideKeyboardWhenTap()
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .padding(.horizontal, 24)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .dmsBackground()
        .navigationTitle("회원가입")
        .dmsBackButton(dismiss: dismiss)
        .navigate(
            to: schoolConfirmationQuestionsComponent.makeView(
                schoolConfirmationQuestionsParam: .init(
                    schoolCode: viewModel.schoolCode,
                    schoolID: viewModel.schoolID
                )
            ),
            when: $viewModel.isNavigateSchoolQuestion
        )
    }
}
