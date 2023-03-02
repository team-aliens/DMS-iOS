import DesignSystem
import SwiftUI
import Kingfisher

struct ChangeProfileView: View {
    @StateObject var viewModel: ChangeProfileViewModel
    @State var isShowingImagePicker = false
    @State var isShowingCameraPicker = false
    @State var isPresentedImageActionSheet = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.tabbarHidden) var tabbarHidden

    init(
        viewModel: ChangeProfileViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            DMSHeaderTitleView(subTitle: "프로필 사진")
                .padding(.top, 24)

            Button {
                isPresentedImageActionSheet.toggle()
            } label: {
                ZStack(alignment: .bottomTrailing) {
                    Group {
                        if let image = viewModel.selectedImage {
                            KFImage(URL(string: ""))
                                .placeholder { _ in
                                    Image(uiImage: image)
                                        .resizable()
                                }
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                        }
                    }
                    .aspectRatio(contentMode: .fill)
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

            DMSWideButton(text: "확인", color: .PrimaryVariant.primary) {
                viewModel.completeButtonDidTap()
            }
            .disabled(viewModel.selectedImage == nil)
            .padding(.top, 32)
            .padding(.bottom, 40)
        }
        .onAppear {
            tabbarHidden.wrappedValue = true
        }
        .onDisappear {
            tabbarHidden.wrappedValue = false
        }
        .imagePicker(isShow: $isShowingImagePicker, uiImage: $viewModel.selectedImage)
        .cameraPicker(isShow: $isShowingCameraPicker, uiImage: $viewModel.selectedImage)
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
        .dmsBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .dmsBackground()
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
        .onChange(of: viewModel.isSuccessChangeImage) { newValue in
            if newValue {
                dismiss()
            }
        }
        .progress(isPresented: $viewModel.isLoading)
    }
}
