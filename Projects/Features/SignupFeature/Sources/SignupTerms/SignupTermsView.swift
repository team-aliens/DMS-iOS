import DesignSystem
import SwiftUI

struct SignupTermsView: View {
    @StateObject var viewModel: SignupTermsViewModel
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: SignupTermsViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)

                    Text("이메일 주소 입력")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                }

                Spacer()
            }
            .padding(.top, 24)

            DMSWebView(urlToLoad: "https://team-aliens-webview.dsm-dms.com/sign-up-policy")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, 56)

            VStack(spacing: 16) {
                HStack(spacing: 8) {
                    DMSCheckBox(isOn: $viewModel.isAgreeTerms)

                    Text("전체 약관 동의")
                        .dmsFont(.text(.small), color: .GrayScale.gray6)

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
            .dmsBackground()
            .shadow(
                color: .GrayScale.gray4.opacity(0.24),
                radius: 20,
                y: 1
            )
        }
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .alert(viewModel.alertMessage, isPresented: $viewModel.isShowingAlert) {
            Button("로그인 화면으로", role: .cancel) {
                rootPresentationMode.wrappedValue.toggle()
            }
        }
    }
}
