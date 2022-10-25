import SwiftUI
import DesignSystem

struct SchoolCodeView: View {

    private enum FocusField {
        case id
        case password
    }
    @StateObject var viewModel: AuthenticationCodeViewModel
    @FocusState private var focusField: FocusField?
    @State var text: String = ""

    public init(viewModel: AuthenticationCodeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)

                    Text("학교 인증코드 입력")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                }.padding(.top, 28)

                Spacer()
            }
            .padding(.horizontal, 24)

            Spacer()
                .frame(height: 60)

            VStack {
                PasscodeView(text: $viewModel.schoolCode)
                    .padding(.horizontal, 64)
                    .onChange(of: viewModel.schoolCode) { _ in
                        viewModel.checkIsEmptyAuthCode()
                    }

                Spacer()
                    .frame(height: 24)

                Text("이메일로 전송된 인증코드 8자리를 입력해주세요.")
                    .dmsFont(.text(.small), color: .GrayScale.gray5)
                    .padding(.horizontal, 24)
                    .frame(height: 40)
            }

            Spacer()

            DMSWideButton(text: "인증", color: .PrimaryVariant.primary) {
                viewModel.verifyAuthCodeButtonDidTap()
            }
            .disabled(viewModel.isDisabled)
            .padding(.bottom, 20)
            .padding(.horizontal, 24)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        Text("A")
    }
}