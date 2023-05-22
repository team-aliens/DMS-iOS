import SwiftUI
import UIKit

public extension View {
    func cameraPicker(isShow: Binding<Bool>, uiImage: Binding<UIImage?>) -> some View {
        self
            .fullScreenCover(isPresented: isShow) {
                CameraPicker(sourceType: .camera, image: uiImage, isPresented: isShow)
            }
    }
}

struct CameraPicker: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType
    @Binding var image: UIImage?
    @Binding var isPresented: Bool

    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

}

final class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var image: UIImage?
    @Binding var isPresented: Bool

    init(image: Binding<UIImage?>, isPresented: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = image
        }
        self.isPresented = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
}
