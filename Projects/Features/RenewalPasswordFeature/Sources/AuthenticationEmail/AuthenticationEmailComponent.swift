import DomainModule
import NeedleFoundation
import SwiftUI

public protocol AuthenticationEmailDependency: Dependency {
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var changePasswordComponent: ChangePasswordComponent { get }

}

public final class AuthenticationEmailComponent: Component<AuthenticationEmailDependency> {
    public func makeView(authenticationEmailParam: AuthenticationEmailParam) -> some View {
        AuthenticationEmailView(
            viewModel: .init(
                sendAuthCodeUseCase: self.dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: self.dependency.verifyAuthCodeUseCase,
                authenticationEmailParam: authenticationEmailParam
            ),
            changePasswordComponent: dependency.changePasswordComponent
        )
    }
}
