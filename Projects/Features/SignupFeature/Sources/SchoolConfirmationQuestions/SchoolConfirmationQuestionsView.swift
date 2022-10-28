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

    public init(viewModel: SchoolConfirmationQuestionsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            AuthHeaderView(subTitle: "학교 확인 질문")
                .padding(.top, 24)

            HStack {
                Text(viewModel.question)
                    .dmsFont(.text(.large), color: .GrayScale.gray7)

                Spacer()
            }
            .padding(.top, 50)

            VStack(spacing: 72) {
                DMSFloatingTextField(
                    "답변",
                    text: $viewModel.answer,
                    isError: viewModel.isErrorOcuured,
                    errorMessage: viewModel.errorMessage
                )
                .focused($focusField, equals: .answer)
            }
            .padding(.top, 42)

            Spacer()

            HStack(spacing: 16) {
                Text("이미 계정이 있으신가요?")
                    .dmsFont(.text(.small), color: .GrayScale.gray5)

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
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .dmsBackground()
        .onAppear {
            viewModel.onAppear()
            focusField = .answer
        }
        .navigationTitle("회원가입")
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct SchoolConfirmationQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("A")
    }
}
