import DomainModule
import SwiftUI
import NeedleFoundation

public protocol SignupEmailVerifyDependency: Dependency {
    var checkDuplicateEmailUseCase: any CheckDuplicateEmailUseCase { get }
}

public final class SignupEmailVerifyComponent: Component<SignupEmailVerifyDependency> {
    public func makeView() -> some View {
        SignupEmailVerifyView(
            viewModel: .init()
        )
    }
}
