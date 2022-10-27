import SwiftUI
import DesignSystem

struct ChangePasswordView: View {
    private enum FocusField {
        case beforePassword
        case newPassword
    }

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: ChangePasswordViewModel

    public init(viewModel: ChangePasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)
                        .padding(.top, 28)

                    Text("아이디 찾기")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                }

                Spacer()
            }

            VStack(spacing: 60) {
                SecureDMSFloatingTextField("새 비밀번호 입력", text: $viewModel.password) {
                }
                .focused($focusField, equals: .beforePassword)

                SecureDMSFloatingTextField("새 비밀번호 확인 ", text: $viewModel.passwordCheck) {
                }
                .focused($focusField, equals: .newPassword)

            }
            .padding(.top, 68)

            Spacer()

            DMSWideButton(text: "확인", color: .PrimaryVariant.primary) {
                viewModel.renewalPasswordButtonDidTap()
            }
            .disabled(viewModel.isRenewalPasswordButtonEnabled)
            .padding(.bottom, 40)
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .dmsBackground()
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .padding(.horizontal, 24)
    }
}
