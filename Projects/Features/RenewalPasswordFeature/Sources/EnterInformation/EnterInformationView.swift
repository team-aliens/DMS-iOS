import SwiftUI
import DesignSystem

struct EnterInformationView: View {
    private enum FocusField {
        case id
        case name
        case email
    }

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: EnterInformationViewModel
    private let authenticationEmailComponent: AuthenticationEmailComponent
    @Environment(\.dismiss) var dismiss

    public init(
        viewModel: EnterInformationViewModel,
        authenticationEmailComponent: AuthenticationEmailComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.authenticationEmailComponent = authenticationEmailComponent
    }

    private func nextButtonDidTap() {
        if !viewModel.id.isEmpty &&
            viewModel.name.isEmpty &&
            viewModel.email.isEmpty {
            viewModel.returnEmailTextField {
                self.focusField = .name
                viewModel.idTextFieldEnabled = true
            }
        } else if viewModel.name.isEmpty {
            focusField = .name
        } else if viewModel.email.isEmpty {
            focusField = .email
        } else {
            viewModel.enterInfoDidComplete()
        }
    }

    var body: some View {
        VStack {
            DMSHeaderTitleView(subTitle: "계정 본인인증")
                .padding(.top, 24)

            VStack(spacing: 20) {
                DMSFloatingTextField(
                    "아이디",
                    text: $viewModel.id,
                    isError: viewModel.isErrorOcuured,
                    errorMessage: viewModel.errorMessage
                ) {
                    withAnimation(Animation.easeIn(duration: 0.2)) {
                        nextButtonDidTap()
                    }
                }
                .focused($focusField, equals: .id)
                .textContentType(.username)
                .disabled(viewModel.idTextFieldEnabled)

                if viewModel.isShowFoundEmail {
                    BlockEmailView(email: $viewModel.blockEmail)
                }
            }
            .padding(.top, 68)
            .transition(.slide)

            if viewModel.isShowFoundEmail {
                VStack(spacing: 60) {
                    DMSFloatingTextField("이름", text: $viewModel.name) {
                        nextButtonDidTap()
                    }
                    .focused($focusField, equals: .name)
                    .textContentType(.name)

                    DMSFloatingTextField("이메일", text: $viewModel.email) {
                        nextButtonDidTap()
                    }
                    .focused($focusField, equals: .email)
                    .textContentType(.emailAddress)
                }
                .padding(.top, 40)
            }

            Spacer()

            DMSWideButton(text: "다음", color: .PrimaryVariant.primary) {
                nextButtonDidTap()
            }
            .disabled(viewModel.isNextButtonEnabled)
            .padding(.bottom, 40)
        }
        .onAppear {
            focusField = .id
        }
        .navigate(
            to: authenticationEmailComponent.makeView(
                authenticationEmailParam: .init(
                    name: viewModel.name,
                    email: viewModel.email,
                    id: viewModel.id
                )
            ),
            when: $viewModel.isNavigateAuthenticationEmail
        )
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .dmsBackButton(dismiss: dismiss)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .padding(.horizontal, 24)
    }
}
