import SwiftUI
import DesignSystem

struct FindIDView: View {
    private enum FocusField {
        case grade
        case classRoom
        case number
        case name
    }
    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: FIndIDViewModel

    public init(viewModel: FIndIDViewModel) {
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
                .padding(.top, 28)

                Spacer()
            }

            Spacer()
                .frame(height: 70)

            VStack(spacing: 60) {
                SchoolSelectButtonView(schoolList: $viewModel.schoolList)

                HStack(spacing: 20) {
                    DMSFloatingTextField("학년", text: $viewModel.grade) {
                        focusField = .classRoom
                    }
                    .focused($focusField, equals: .grade)
                    .keyboardType(.numberPad)

                    DMSFloatingTextField("반", text: $viewModel.classRoom) {
                        focusField = .number
                    }
                    .focused($focusField, equals: .classRoom)
                    .keyboardType(.numberPad)

                    DMSFloatingTextField("번호", text: $viewModel.number) {
                        focusField = .name
                    }
                    .focused($focusField, equals: .number)
                    .keyboardType(.numberPad)
                }

                DMSFloatingTextField("이름", text: $viewModel.name) {
                    viewModel.findIDButtonDidTap()
                }
                .focused($focusField, equals: .name)

            }

            Spacer()

            DMSWideButton(text: "아이디 찾기", color: .PrimaryVariant.primary) {
                viewModel.findIDButtonDidTap()
            }
            .disabled(!viewModel.isSigninButtonEnabled)
            .padding(.bottom, 40)
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .dmsBackground()
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .padding(.horizontal, 24)
    }
}
