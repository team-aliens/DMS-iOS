import SwiftUI
import DesignSystem

struct SchoolConfirmationQuestionsView: View {
    @StateObject var viewModel: SchoolConfirmationQuestionsViewModel

    public init(viewModel: SchoolConfirmationQuestionsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)

                    Text("학교 확인 질문")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)

                    Text("우리 학교 학생 수는?")
                        .dmsFont(.text(.large), color: .GrayScale.gray7)
                        .padding(.top, 50)
                }

                Spacer()
            }

            .padding(.top, 24)

            VStack(spacing: 72) {
                DMSFloatingTextField(
                    "답변",
                    text: $viewModel.answer,
                    isError: viewModel.isErrorOcuured
                )
            }
            .padding(.top, 42)

            Spacer()

            HStack(spacing: 16) {
                Text("이미 계정이 있으신가요?")
                    .dmsFont(.text(.small), color: .GrayScale.gray5)

                DMSButton(text: "로그인", style: .text, color: .GrayScale.gray6) {
                }
            }

            DMSWideButton(text: "확인", color: .PrimaryVariant.primary) {
                viewModel.confirmButtonDidTap()
            }
            .disabled(!viewModel.isConfirmButtonEnabled)
            .padding(.top, 24)
            .padding(.bottom, 40)
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .dmsBackground()
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct SchoolConfirmationQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("A")
    }
}
