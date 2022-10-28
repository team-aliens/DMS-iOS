import SwiftUI
import SignupFeature
import DesignSystem

struct SigninView: View {
    private enum FocusField {
        case id
        case password
    }
    @StateObject var viewModel: SigninViewModel
    @FocusState private var focusField: FocusField?

    private let schoolCodeComponent: SchoolCodeComponent

    public init(
        viewModel: SigninViewModel,
        schoolCodeComponent: SchoolCodeComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.schoolCodeComponent = schoolCodeComponent
    }

    var body: some View {
        VStack {
            AuthHeaderView(subTitle: "더 편한 기숙사 생활을 위해")
                .padding(.top, 24)

            VStack(spacing: 72) {
                DMSFloatingTextField(
                    "아이디",
                    text: $viewModel.id,
                    isError: viewModel.isErrorOcuured
                ) {
                    focusField = .password
                }
                .textContentType(.username)
                .focused($focusField, equals: .id)

                SecureDMSFloatingTextField("비밀번호", text: $viewModel.password) {
                    viewModel.signinButtonDidTap()
                }
                .textContentType(.password)
                .focused($focusField, equals: .password)
            }
            .padding(.top, 56)

            HStack(spacing: 16) {
                HStack(spacing: 12) {
                    DMSCheckBox(isOn: $viewModel.isOnAutoSignin)

                    Text("자동로그인")
                        .dmsFont(.text(.small), color: .GrayScale.gray6)
                }
                .onTapGesture {
                    withAnimation {
                        viewModel.isOnAutoSignin.toggle()
                    }
                }

                Spacer()

                NavigationLink {
                    Text("아이디 찾기")
                } label: {
                    Text("아이디 찾기")
                        .dmsFont(.text(.extraSmall), color: .GrayScale.gray5)
                }

                Divider()
                    .foregroundColor(.GrayScale.gray5)
                    .frame(height: 13)

                NavigationLink {
                    Text("비밀번호 재설정")
                } label: {
                    Text("비밀번호 재설정")
                        .dmsFont(.text(.extraSmall), color: .GrayScale.gray5)
                }
            }
            .padding(.top, 16)

            Spacer()

            HStack(spacing: 16) {
                Text("아직 회원이 아니신가요?")
                    .dmsFont(.text(.extraSmall), color: .GrayScale.gray5)

                DMSButton(text: "회원가입", style: .text, color: .GrayScale.gray6) {
                    viewModel.isNavigateSignup.toggle()
                }
            }

            DMSWideButton(text: "로그인", color: .PrimaryVariant.primary) {
                viewModel.signinButtonDidTap()
            }
            .disabled(!viewModel.isSigninEnabled)
            .padding(.top, 24)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 40)
        }
        .navigationTitle("로그인")
        .navigationBarTitleDisplayMode(.inline)
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .dmsBackground()
        .navigate(to: schoolCodeComponent.makeView(), when: $viewModel.isNavigateSignup)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
