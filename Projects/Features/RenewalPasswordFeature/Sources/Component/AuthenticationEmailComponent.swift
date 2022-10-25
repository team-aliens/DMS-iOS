import DomainModule
import NeedleFoundation
import SwiftUI

public protocol AuthenticationEmailDependency: Dependency {
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
}

public final class AuthenticationEmailComponent: Component<AuthenticationEmailDependency> {
    public func makeView() -> some View {
        AuthenticationEmailView(
            viewModel: .init(
                verifyAuthCodeUseCase: self.dependency.verifyAuthCodeUseCase,
                sendAuthCodeUseCase: self.dependency.sendAuthCodeUseCase
            )
        )
    }
}
