import DesignSystem
import SwiftUI

struct IDSettingView: View {
    private enum FocusField {
        case grade
        case `class`
        case number
        case id
    }
    @StateObject var viewModel: IDSettingViewModel
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var focusField: FocusField?
    private let signupPasswordComponent: SignupPasswordComponent

    public init(
        viewModel: IDSettingViewModel,
        signupPasswordComponent: SignupPasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupPasswordComponent = signupPasswordComponent
    }

    var body: some View {
        VStack(spacing: 4) {
            DMSHeaderTitleView(subTitle: "아이디 설정")
                .padding(.top, 24)

            HStack {
                Text("학년, 반, 번호는 숫자만 입력하여 주세요.")
                    .dmsFont(.etc(.caption), color: .GrayScale.gray5)

                Spacer()
            }

            VStack(spacing: 30) {
                HStack(spacing: 20) {
                    DMSFloatingTextField(
                        "학년",
                        text: $viewModel.grade,
                        isError: viewModel.isErrorOcuured
                    )
                    .focused($focusField, equals: .grade)

                    DMSFloatingTextField(
                        "반",
                        text: $viewModel.group,
                        isError: viewModel.isErrorOcuured
                    )
                    .focused($focusField, equals: .class)

                    DMSFloatingTextField(
                        "번호",
                        text: $viewModel.number,
                        isError: viewModel.isErrorOcuured
                    )
                    .focused($focusField, equals: .number)
                }
                .keyboardType(.numberPad)
                .padding(.top, 94)

                if viewModel.isShowingCheckStudent && !viewModel.isCheckedStudent {
                    HStack {
                        Text("\(viewModel.checkedName)님이 맞으신가요?")
                            .dmsFont(.body(.body3), color: .GrayScale.gray7)
                            .padding(.leading, 20)

                        Spacer()

                        DMSButton(text: "확인", style: .text, color: .GrayScale.gray6) {
                            withAnimation {
                                viewModel.nameCheckButtonDidTap()
                                focusField = .id
                            }
                        }
                        .padding(.trailing, 20)
                    }
                    .animation(.default, value: viewModel.isShowingCheckStudent)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background {
                        if colorScheme == .light {
                            Color.GrayScale.gray2
                        } else {
                            Color.GrayScale.gray3
                        }
                    }
                }

                if viewModel.isCheckedStudent {
                    DMSFloatingTextField(
                        "아이디",
                        text: $viewModel.id,
                        isError: viewModel.isInvalidIDError,
                        errorMessage: "아이디가 이미 존재합니다."
                    ) {
                        viewModel.nextButtonDidTap()
                    }
                    .focused($focusField, equals: .id)
                    .padding(.top, 56)
                }
            }

            Spacer()

            DMSWideButton(text: "다음", color: .PrimaryVariant.primary) {
                withAnimation {
                    viewModel.nextButtonDidTap()
                    focusField = nil
                }
            }
            .padding(.bottom, 40)
            .disabled(!viewModel.isEnabledNextStep)
        }
        .onAppear {
            focusField = .grade
        }
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
        .dmsToast(isShowing: $viewModel.isShowingErrorToast, message: viewModel.errorToastMessage, style: .error)
        .navigate(
            to: signupPasswordComponent.makeView(
                signupPasswordParam: .init(
                    idSettingParam: viewModel.idSettingParam,
                    grade: Int(viewModel.grade) ?? 0,
                    class: Int(viewModel.group) ?? 0,
                    number: Int(viewModel.number) ?? 0,
                    accountID: viewModel.id
                )
            ),
            when: $viewModel.isNavigateSignupPassword
        )
    }
}
