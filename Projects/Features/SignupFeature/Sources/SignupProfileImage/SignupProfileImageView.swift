import DesignSystem
import SwiftUI

struct SignupProfileImageView: View {
    @StateObject var viewModel: SignupProfileImageViewModel
    @State var isShowingImagePicker = false
    @State var isShowingCameraPicker = false
    @State var isPresentedImageActionSheet = false
    private let signupTermsComponent: SignupTermsComponent

    public init(
        viewModel: SignupProfileImageViewModel,
        signupTermsComponent: SignupTermsComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupTermsComponent = signupTermsComponent
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
                isPresentedImageActionSheet.toggle()
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
        .cameraPicker(isShow: $isShowingCameraPicker, uiImage: $viewModel.selectedImage)
        .padding(.horizontal, 24)
        .dmsActionSheet(isPresented: $isPresentedImageActionSheet) {
            Button(role: nil) {
                isPresentedImageActionSheet = false
                isShowingCameraPicker.toggle()
            } label: {
                Label("사진 촬영", systemImage: "camera.fill")
            }
            .foregroundColor(.GrayScale.gray6)

            Divider()
                .foregroundColor(.GrayScale.gray4)

            Button(role: nil) {
                isPresentedImageActionSheet = false
                isShowingImagePicker.toggle()
            } label: {
                Label("사진 선택", systemImage: "photo.tv")
            }
            .foregroundColor(.GrayScale.gray6)
        }
    }
}
