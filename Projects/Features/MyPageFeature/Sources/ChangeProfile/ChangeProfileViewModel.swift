import BaseFeature
import Combine
import DomainModule
import UIKit

final class ChangeProfileViewModel: BaseViewModel {
    @Published var selectedImage: UIImage?
    @Published var isSuccessChangeImage = false
    @Published var presignedURLEntity: PresignedURLEntity?

    private let changeProfileImageUseCase: any ChangeProfileImageUseCase
    private let uploadFileUseCase: any UploadFileUseCase
    private let fetchPresignedURLUseCase: any FetchPresignedURLUseCase

    public init(
        changeProfileImageUseCase: any ChangeProfileImageUseCase,
        uploadFileUseCase: any UploadFileUseCase,
        fetchPresignedURLUseCase: any FetchPresignedURLUseCase
    ) {
        self.changeProfileImageUseCase = changeProfileImageUseCase
        self.uploadFileUseCase = uploadFileUseCase
        self.fetchPresignedURLUseCase = fetchPresignedURLUseCase
    }

    func completeButtonDidTap() {
        guard let data = selectedImage?.jpegData(compressionQuality: 0.1) else { return }
//        addCancellable(
//            uploadFileUseCase.execute(data: data)
//                .flatMap(changeProfileImageUseCase.execute)
//                .eraseToAnyPublisher()
//        ) { [weak self] _ in
//            self?.isSuccessChangeImage = true
//        }
        addCancellable(
            fetchPresignedURLUseCase.execute()
        ) { [weak self] presignedURLEntity in
            self?.presignedURLEntity = presignedURLEntity
        }
    }
}
