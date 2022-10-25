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

    public init(viewModel: EnterInformationViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)
                        .padding(.top, 28)

                    Text("계정 본인인증")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                }

                Spacer()
            }
            VStack(spacing: 20) {
                DMSFloatingTextField("아이디", text: $viewModel.id) {
                    focusField = .name
                    withAnimation(Animation.easeIn(duration: 0.2)) {
                        viewModel.returnEmailTextField()
                    }
                }
                .focused($focusField, equals: .id)
                .textContentType(.nickname)

                if viewModel.isShow {
                    BlockEmailView(email: $viewModel.blockEmail, isShow: $viewModel.isShow)
                }

            }
            .padding(.top, 68)
            .transition(.slide)

            VStack(spacing: 60) {
                DMSFloatingTextField("이름", text: $viewModel.name) {
                    focusField = .email
                }
                .focused($focusField, equals: .name)
                .textContentType(.name)

                DMSFloatingTextField("이메일", text: $viewModel.email) {
                    viewModel.nextButtonDidTap()
                }
                .focused($focusField, equals: .email)
                .textContentType(.emailAddress)
            }
            .padding(.top, 40)

            Spacer()

            DMSWideButton(text: "다음", color: .PrimaryVariant.primary) {
                viewModel.nextButtonDidTap()
            }
            .disabled(!viewModel.isNextButtonEnabled )
            .padding(.bottom, 40)

        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .padding(.horizontal, 24)

    }
}