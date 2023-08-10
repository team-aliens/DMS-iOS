import SwiftUI
import DesignSystem
import SignupFeatureInterface
import UtilityModule
import BaseFeature

struct SchoolCodeView: View {
    @StateObject var viewModel: SchoolCodeViewModel
    @Environment(\.dismiss) var dismiss
    private let schoolConfirmationQuestionsFactory: any SchoolConfirmationQuestionsFactory

    public init(
        viewModel: SchoolCodeViewModel,
        schoolConfirmationQuestionsFactory: any SchoolConfirmationQuestionsFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.schoolConfirmationQuestionsFactory = schoolConfirmationQuestionsFactory
    }

    var body: some View {
        VStack {
            DMSHeaderTitleView(subTitle: "학교 인증코드 입력")
                .padding(.top, 24)

            VStack(spacing: 24) {
                DMSPassCodeView(codeCount: 8, text: $viewModel.schoolCode)

                Text(viewModel.isErrorOcuured ? viewModel.errorMessage : "소속된 학교의 인증코드 8자리를 입력해주세요.")
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
            to: schoolConfirmationQuestionsFactory.makeView(
                schoolConfirmationQuestionsParam: .init(
                    schoolCode: viewModel.schoolCode,
                    schoolID: viewModel.schoolID
                )
            )
            .eraseToAnyView(),
            when: $viewModel.isNavigateSchoolQuestion
        )
    }
}
