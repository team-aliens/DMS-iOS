import DomainModule
import SwiftUI
import NeedleFoundation

public protocol SignupEmailVerifyDependency: Dependency {
    var checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase { get }
    var signupEmailAuthCodeVerifyComponent: SignupEmailAuthCodeVerifyComponent { get }
}

public final class SignupEmailVerifyComponent: Component<SignupEmailVerifyDependency> {
    public func makeView(signupEmailVerifyParam: SignupEmailVerifyParam) -> some View {
        SignupEmailVerifyView(
            viewModel: .init(
                checkDuplicateEmailUseCase: dependency.checkDuplicateEmailUseCase,
                signupEmailVerifyParam: signupEmailVerifyParam
            )
        )
    }
}
