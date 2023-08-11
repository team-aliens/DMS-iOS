import BaseFeature
import Combine
import FilesDomainInterface
import StudentsDomainInterface
import UIKit

final class ChangeProfileViewModel: BaseViewModel {
    @Published var selectedImage: UIImage?
    @Published var isSuccessChangeImage = false
    @Published var presignedURLEntity: PresignedURLEntity?

    private let changeProfileImageUseCase: any ChangeProfileImageUseCase
    private let uploadFileUseCase: any UploadFileUseCase
    private let fetchPresignedURLUseCase: any FetchPresignedURLUseCase
    private let presigendUploadFileUseCase: any PresignedUploadFileUseCase

    public init(
        changeProfileImageUseCase: any ChangeProfileImageUseCase,
        uploadFileUseCase: any UploadFileUseCase,
        fetchPresignedURLUseCase: any FetchPresignedURLUseCase,
        presigendUploadFileUseCase: any PresignedUploadFileUseCase
    ) {
        self.changeProfileImageUseCase = changeProfileImageUseCase
        self.uploadFileUseCase = uploadFileUseCase
        self.fetchPresignedURLUseCase = fetchPresignedURLUseCase
        self.presigendUploadFileUseCase = presigendUploadFileUseCase
    }

    func completeButtonDidTap() {
        guard let data = selectedImage?.jpegData(compressionQuality: 0.1) else { return }
        addCancellable(
            uploadFileUseCase.execute(data: data)
                .flatMap(changeProfileImageUseCase.execute)
                .eraseToAnyPublisher()
        ) { [weak self] _ in
            self?.isSuccessChangeImage = true
        }
//        addCancellable(
//            fetchPresignedURLUseCase.execute()
//        ) { [weak self] presignedURLEntity in
//            self?.presignedURLEntity = presignedURLEntity
//            self?.uploadFile()
//        }
    }

    func uploadFile() {
        guard let data = selectedImage?.jpegData(compressionQuality: 0.1) else { return }
        addCancellable(
            presigendUploadFileUseCase.execute(uploadURL: presignedURLEntity?.fileUploadURL ?? "", data: data)
        ) { [weak self] _ in
            self?.changeProfile()
        }
    }

    func changeProfile() {
        addCancellable(
            changeProfileImageUseCase.execute(url: presignedURLEntity?.fileURL ?? "")
        ) { [weak self] _ in
            self?.isSuccessChangeImage = true
        }
    }
}
