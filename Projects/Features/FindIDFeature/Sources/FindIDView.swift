import SwiftUI
import DesignSystem

struct FindIdView: View {

    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: FIndIDViewModel

    private enum FocusField {
        case grade
        case classRoom
        case number
        case name
    }

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

                    DMSFloatingTextField("반", text: $viewModel.classRoom) {
                        focusField = .number
                    }
                    .focused($focusField, equals: .classRoom)

                    DMSFloatingTextField("번호", text: $viewModel.number) {
                        focusField = .name
                    }
                    .focused($focusField, equals: .number)

                }
                DMSFloatingTextField("이름", text: $viewModel.name) {
                    viewModel.findIDButtonDidTap()
                }
                .focused($focusField, equals: .name)

            }

            Spacer()
                .padding(.top, 68)

            DMSWideButton(text: "아이디 찾기", color: .PrimaryVariant.primary) {
                viewModel.findIDButtonDidTap()
            }

        }
        .navigationTitle("아이디 찾기")
        .dmsBackground()
        .navigationBarTitleDisplayMode(.inline)
        .padding(24)
    }
}