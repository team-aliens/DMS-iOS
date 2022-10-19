import SwiftUI
import DesignSystem

struct SigninView: View {
    private enum FocusField {
        case id
        case password
    }
    @StateObject var viewModel: SigninViewModel
    @FocusState private var focusField: FocusField?

    public init(viewModel: SigninViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)
                        .padding(.top, 28)

                    Text("더 편한 기숙사 생활을 위해")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                }

                Spacer()
            }

            VStack(spacing: 72) {
                DMSFloatingTextField("아이디", text: $viewModel.id) {
                    focusField = .password
                }
                .focused($focusField, equals: .id)

                SecureDMSFloatingTextField("비밀번호", text: $viewModel.password) {
                    viewModel.signinButtonDidTap()
                }
                .focused($focusField, equals: .password)
            }
            .padding(.top, 68)

            HStack(spacing: 16) {
                HStack(spacing: 12) {
                    DMSRadioButton(isOn: $viewModel.isOnAutoSignin)

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
                    viewModel.isNavigateSignin.toggle()
                }
            }

            DMSWideButton(text: "로그인", color: .PrimaryVariant.primary) {
                viewModel.signinButtonDidTap()
            }
            .padding(.top, 24)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .dmsBackground()
        .navigate(to: Text("회원가입"), when: $viewModel.isNavigateSignin)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        Text("A")
    }
}
