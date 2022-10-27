import BaseFeature
import Combine
import UIKit

final class SignupProfileImageViewModel: BaseViewModel {
    @Published var selectedImage: UIImage?
    let signupProfileImageParam: SignupProfileImageParam

    init(signupProfileImageParam: SignupProfileImageParam) {
        self.signupProfileImageParam = signupProfileImageParam
    }

    func skipButtonDidTap() {}

    func nextButtonDidTap() {}
}
