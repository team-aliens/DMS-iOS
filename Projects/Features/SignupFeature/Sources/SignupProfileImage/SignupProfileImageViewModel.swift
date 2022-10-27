import BaseFeature
import Combine

final class SignupProfileImageViewModel: BaseViewModel {
    let signupProfileImageParam: SignupProfileImageParam

    init(signupProfileImageParam: SignupProfileImageParam) {
        self.signupProfileImageParam = signupProfileImageParam
    }
}
