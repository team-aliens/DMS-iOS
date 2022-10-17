import Combine
import BaseFeature

final class SigninViewModel: BaseViewModel {
    @Published var id = ""
    @Published var password = ""
    @Published var isOnAutoSignin = true
    @Published var isNavigationSignin = false

    func signinButtonDidTap() {
    }
}
