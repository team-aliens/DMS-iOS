import DesignSystem
import SwiftUI

struct IDSettingView: View {
    @StateObject var viewModel: IDSettingViewModel

    public init(
        viewModel: IDSettingViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 4) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)

                    Text("아이디 설정")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)

                    Text("학년, 반, 번호는 숫자만 입력하여 주세요.")
                        .dmsFont(.text(.extraSmall), color: .GrayScale.gray5)
                }

                Spacer()
            }
            .padding(.top, 24)

            VStack(spacing: 60) {
                HStack(spacing: 20) {
                    DMSFloatingTextField(
                        "학년",
                        text: $viewModel.grade,
                        isError: viewModel.isErrorOcuured
                    )

                    DMSFloatingTextField(
                        "반",
                        text: $viewModel.group,
                        isError: viewModel.isErrorOcuured
                    )

                    DMSFloatingTextField(
                        "번호",
                        text: $viewModel.number,
                        isError: viewModel.isErrorOcuured
                    )
                }
                .keyboardType(.numberPad)
                .padding(.top, 94)

                DMSFloatingTextField(
                    "아이디",
                    text: $viewModel.id,
                    isError: viewModel.isInvalidIDError,
                    errorMessage: "아이디가 유효하지 않습니다."
                ) {
                    viewModel.nextButtonDidTap()
                }
            }

            Spacer()

            DMSWideButton(text: "다음", color: .PrimaryVariant.primary) {
                viewModel.nextButtonDidTap()
            }
            .padding(.bottom, 40)
            .disabled(!viewModel.isEnabledNextStep)
        }
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
