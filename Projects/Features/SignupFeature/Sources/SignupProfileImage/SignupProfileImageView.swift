import DesignSystem
import SwiftUI

struct SignupProfileImageView: View {
    @StateObject var viewModel: SignupProfileImageViewModel
    @State var isShowingImagePicker = false

    public init(viewModel: SignupProfileImageViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("DMS")
                        .dmsFont(.title(.extraLarge), color: .PrimaryVariant.primary)

                    Text("프로필 사진")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                }

                Spacer()
            }
            .padding(.top, 24)

            Button {
                isShowingImagePicker.toggle()
            } label: {
                ZStack(alignment: .bottomTrailing) {
                    Group {
                        if let image = viewModel.selectedImage {
                            Image(uiImage: image)
                                .resizable()
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                        }
                    }
                    .foregroundColor(.GrayScale.gray4)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())

                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .clipShape(Circle())
                        .foregroundColor(.PrimaryVariant.primary)
                }
                .padding(.top, 80)
            }

            Spacer()

            DMSButton(text: "다음에 설정하기", style: .underline, color: .GrayScale.gray6) {
                viewModel.skipButtonDidTap()
            }

            DMSWideButton(text: "다음", color: .PrimaryVariant.primary) {
                viewModel.nextButtonDidTap()
            }
            .disabled(viewModel.selectedImage == nil)
            .padding(.top, 32)
            .padding(.bottom, 40)
        }
        .imagePicker(isShow: $isShowingImagePicker, uiImage: $viewModel.selectedImage)
        .padding(.horizontal, 24)
    }
}
