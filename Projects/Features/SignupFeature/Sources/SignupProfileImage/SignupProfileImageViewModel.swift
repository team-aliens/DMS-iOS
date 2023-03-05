import BaseFeature
import Combine
import DomainModule
import UIKit

final class SignupProfileImageViewModel: BaseViewModel {
    @Published var selectedImage: UIImage?
    @Published var isSkip = false
    @Published var isNavigateSignupTerms = false
    @Published var selectedImageURLString: String = ""

    private let uploadFileUseCase: any UploadFileUseCase
    let signupProfileImageParam: SignupProfileImageParam

    init(
        uploadFileUseCase: any UploadFileUseCase,
        signupProfileImageParam: SignupProfileImageParam
    ) {
        self.uploadFileUseCase = uploadFileUseCase
        self.signupProfileImageParam = signupProfileImageParam
    }

    func skipButtonDidTap() {
        isSkip = true
        isNavigateSignupTerms = true
    }

    func nextButtonDidTap() {
        self.isSkip = false
        addCancellable(
            uploadFileUseCase.execute(data: selectedImage?.pngData() ?? .init())
        ) { [weak self] url in
            self?.selectedImageURLString = url
            self?.isNavigateSignupTerms = true
        }
    }
}
