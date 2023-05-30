import StudentsDomainInterface
import SwiftUI
import NeedleFoundation
import SignupFeatureInterface

public protocol SignupEmailVerifyDependency: Dependency {
    var checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase { get }
    var signupEmailAuthCodeVerifyFactory: any SignupEmailAuthCodeVerifyFactory { get }
}

public final class SignupEmailVerifyComponent: Component<SignupEmailVerifyDependency>, SignupEmailVerifyFactory {
    public func makeView(signupEmailVerifyParam: SignupEmailVerifyParam) -> some View {
        SignupEmailVerifyView(
            viewModel: .init(
                checkDuplicateEmailUseCase: dependency.checkDuplicateEmailUseCase,
                signupEmailVerifyParam: signupEmailVerifyParam
            ),
            signupEmailAuthCodeVerifyFactory: dependency.signupEmailAuthCodeVerifyFactory
        )
    }
}
