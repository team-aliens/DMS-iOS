import BaseFeature
import DesignSystem
import FindIDFeature
import RenewalPasswordFeature
import SwiftUI
import SignupFeature
import Utility

struct SigninView: View {
    private enum FocusField {
        case id
        case password
    }
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SigninViewModel
    @FocusState private var focusField: FocusField?
    @State var isNavigateSignup = false

    private let schoolCodeComponent: SchoolCodeComponent
    private let findIDComponent: FindIDComponent
    private let enterInformationComponent: EnterInformationComponent

    public init(
        viewModel: SigninViewModel,
        schoolCodeComponent: SchoolCodeComponent,
        findIDComponent: FindIDComponent,
        enterInformationComponent: EnterInformationComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.schoolCodeComponent = schoolCodeComponent
        self.findIDComponent = findIDComponent
        self.enterInformationComponent = enterInformationComponent
    }

    var body: some View {
        NavigationView {
            VStack {
                DMSHeaderTitleView(subTitle: "더 편한 기숙사 생활을 위해")
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

                    SecureDMSFloatingTextField(
                        "비밀번호",
                        text: $viewModel.password,
                        isError: viewModel.isErrorOcuured,
                        errorMessage: viewModel.errorMessage
                    ) {
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
                            .dmsFont(.body(.body3), color: .GrayScale.gray6)
                    }
                    .onTapGesture {
                        withAnimation {
                            viewModel.isOnAutoSignin.toggle()
                        }
                    }

                    Spacer()

                    NavigationLink {
                        DeferView {
                            findIDComponent.makeView()
                        }
                    } label: {
                        Text("아이디 찾기")
                            .dmsFont(.etc(.caption), color: .GrayScale.gray5)
                    }

                    Divider()
                        .foregroundColor(.GrayScale.gray5)
                        .frame(height: 13)

                    NavigationLink {
                        DeferView {
                            enterInformationComponent.makeView()
                        }
                    } label: {
                        Text("비밀번호 재설정")
                            .dmsFont(.etc(.caption), color: .GrayScale.gray5)
                    }
                }
                .padding(.top, 16)

                Spacer()

                HStack(spacing: 16) {
                    Text("아직 회원이 아니신가요?")
                        .dmsFont(.etc(.caption), color: .GrayScale.gray5)

                    DMSButton(text: "회원가입", style: .text, color: .GrayScale.gray6) {
                        isNavigateSignup.toggle()
                    }
                }

                DMSWideButton(text: "로그인", color: .PrimaryVariant.primary) {
                    viewModel.signinButtonDidTap()
                }
                .disabled(!viewModel.isSigninEnabled)
                .padding(.top, 24)
                .padding(.bottom, 40)
            }
            .navigationTitle("로그인")
            .navigationBarTitleDisplayMode(.inline)
            .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
            .padding(.horizontal, 24)
            .dmsBackground()
            .navigate(
                to: schoolCodeComponent.makeView(),
                when: $isNavigateSignup
            )
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .onChange(of: viewModel.isSuccessSignin) { newValue in
            guard newValue else { return }
            appState.sceneFlow = .main
        }
        .navigationViewStyle(.stack)
        .environment(\.rootPresentationMode, $isNavigateSignup)
    }
}
