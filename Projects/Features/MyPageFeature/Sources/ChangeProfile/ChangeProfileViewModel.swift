import BaseFeature
import Combine
import DomainModule
import UIKit

final class ChangeProfileViewModel: BaseViewModel {
    @Published var selectedImage: UIImage?
    @Published var isSuccessChangeImage = false

    private let changeProfileImageUseCase: any ChangeProfileImageUseCase
    private let uploadFileUseCase: any UploadFileUseCase

    public init(
        changeProfileImageUseCase: any ChangeProfileImageUseCase,
        uploadFileUseCase: any UploadFileUseCase
    ) {
        self.changeProfileImageUseCase = changeProfileImageUseCase
        self.uploadFileUseCase = uploadFileUseCase
    }

    func completeButtonDidTap() {
        guard let data = selectedImage?.pngData() else { return }
        addCancellable(
            uploadFileUseCase.execute(data: data)
                .flatMap(changeProfileImageUseCase.execute)
                .eraseToAnyPublisher()
        ) { [weak self] _ in
            self?.isSuccessChangeImage = true
        }

    }
}
