import DesignSystem
import BaseFeature
import SwiftUI
import Utility

struct SignupTermsView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SignupTermsViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme

    init(
        viewModel: SignupTermsViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            DMSHeaderTitleView(subTitle: "약관 동의")
                .padding(.top, 24)

            DMSWebView(urlToLoad: colorScheme == .light ?
                       "https://webview.aliens-dms.com/policy/privacy?theme=light" :
                        "https://webview.aliens-dms.com/policy/privacy?theme=dark")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 56)

            VStack(spacing: 16) {
                HStack(spacing: 8) {
                    DMSCheckBox(isOn: $viewModel.isAgreeTerms)

                    Text("전체 약관 동의")
                        .dmsFont(.body(.body3), color: .GrayScale.gray6)

                    Spacer()
                }
                .onTapGesture {
                    viewModel.isAgreeTerms.toggle()
                }

                DMSWideButton(text: "확인", color: .PrimaryVariant.primary) {
                    viewModel.confirmButtonDidTap()
                }
                .disabled(!viewModel.isAgreeTerms)
                .padding(.bottom, 40)
            }
            .padding(.top, 16)
            .shadow(
                color: .GrayScale.gray4.opacity(0.24),
                y: 1,
                blur: 20
            )
        }
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .dmsBackground()
        .alert(viewModel.alertMessage, isPresented: $viewModel.isShowingAlert) {
            Button("확인", role: .cancel) {
                appState.sceneFlow = .  main
            }
        }
        .onChange(of: viewModel.dmsFeatures) { newValue in
            if let newValue {
                appState.features = newValue
            }
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
    }
}
