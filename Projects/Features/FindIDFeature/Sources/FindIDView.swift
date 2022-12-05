import SwiftUI
import DesignSystem
import Utility

struct FindIDView: View {
    private enum FocusField {
        case grade
        case classRoom
        case number
        case name
    }
    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: FIndIDViewModel
    @Environment(\.dismiss) var dismiss

    public init(viewModel: FIndIDViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            DMSHeaderTitleView(subTitle: "아이디 찾기")
                .padding(.top, 24)

            VStack(spacing: 60) {
                SchoolSelectButtonView(schoolList: $viewModel.schoolList) { school in
                    viewModel.schoolID = school.id
                }

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
            .padding(.top, 68)

            Spacer()

            DMSWideButton(text: "아이디 찾기", color: .PrimaryVariant.primary) {
                viewModel.findIDButtonDidTap()
            }
            .disabled(!viewModel.isFindEnabled)
            .padding(.bottom, 40)
        }
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .padding(.horizontal, 24)
        .dmsBackground()
        .dmsBackButton(dismiss: dismiss)
        .onAppear { viewModel.onAppear() }
        .frame(maxWidth: .infinity)
        .alert("\(viewModel.email)으로 아이디가 전송되었습니다.", isPresented: $viewModel.isSuccessFindID) {
            Button("확인") {
                NavigationUtil.popToRootView()
            }
        }
    }
}
